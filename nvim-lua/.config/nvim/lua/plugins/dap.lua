return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'debug-helper',
      'jbyuki/one-small-step-for-vimkind',
    },
    lazy = true,
    config = function()
      local dap = require('dap')

      local api = vim.api
      local installation_path = vim.fn.stdpath('data') .. '/dap_debuggers'

      -- mkdir -p ~/.local/share/nvim/dap_debuggers && cd "$_"
      -- git clone https://github.com/microsoft/vscode-node-debug2.git && cd vscode-node-debug2
      -- npm install
      -- NODE_OPTIONS=--no-experimental-fetch npm run build
      dap.adapters.node2 = {
        type = 'executable',
        command = 'node',
        args = { installation_path .. '/vscode-node-debug2/out/src/nodeDebug.js' },
      }

      dap.configurations.javascript = {
        {
          name = 'Launch',
          type = 'node2',
          request = 'launch',
          program = '${file}',
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = 'inspector',
          console = 'integratedTerminal',
        },
        {
          name = 'Attach to process',
          type = 'node2',
          request = 'attach',
          processId = require('dap.utils').pick_process,
        },
      }

      -- gem install debug
      dap.adapters.ruby = function(callback, config)
        local stdout = vim.loop.new_pipe(false)
        local handle
        local pid_or_err

        local opts = {
          stdio = { nil, stdout },
          args = { '--open', '--port', config.port, '-c', '--', config.command, config.script },
          detached = true
        }

        handle, pid_or_err = vim.loop.spawn('rdbg', opts, function(code)
          stdout:close()
          handle:close()
          if code ~= 0 then
            print('rdbg exited with code', code)
          end
        end)

        assert(handle, 'Error running rdbg: ' .. tostring(pid_or_err))

        stdout:read_start(function(err, chunk)
          assert(not err, err)
          if chunk then
            vim.schedule(function()
              require('dap.repl').append(chunk)
            end)
          end
        end)

        vim.defer_fn(function()
          callback({ type = 'server', host = '127.0.0.1', port = config.port })
        end, 500)
      end

      dap.configurations.ruby = {
        {
          name = 'Launch',
          type = 'ruby',
          request = 'launch',
          command = 'ruby',
          script = '${file}',
          port = 38697,
        },
      }

      -- go install github.com/go-delve/delve/cmd/dlv@latest
      -- mkdir -p ~/.local/share/nvim/dap_debuggers
      -- cp ~/.dotfiles/scripts/dlv-wrapper.sh ~/.local/share/nvim/dap_debuggers/dlv-wrapper.sh
      dap.adapters.delve = {
        type = 'server',
        port = '${port}',
        executable = {
          command = installation_path .. '/dlv-wrapper.sh',
          args = { 'dap', '-l', '127.0.0.1:${port}' },
        },
      }

      dap.configurations.go = {
        {
          type = 'delve',
          name = 'Debug',
          request = 'launch',
          program = '${file}',
        },
        {
          type = 'delve',
          name = 'Debug test',
          request = 'launch',
          mode = 'test',
          program = '${file}',
        },
        {
          type = 'delve',
          name = 'Debug test (go.mod)',
          request = 'launch',
          mode = 'test',
          program = './${relativeFileDirname}',
        },
      }

      dap.adapters.nlua = function(callback, config)
        callback({
          type = 'server',
          host = config.host or '127.0.0.1',
          port = config.port or 8086,
        })
      end

      dap.configurations.lua = {
        {
          type = 'nlua',
          request = 'attach',
          name = 'Attach to running Neovim instance',
        }
      }

      vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'GruvboxRed', linehl = '', numhl = '' })

      api.nvim_set_keymap('n', '<leader>dt', ":lua require('dap').toggle_breakpoint()<CR>", { noremap = true })
      api.nvim_set_keymap('n', '<leader>dq', ":lua require('dap').terminate()<CR>", { noremap = true })
      api.nvim_set_keymap('n', '<leader>dc', ":lua require('dap').continue()<CR>", { noremap = true })
      api.nvim_set_keymap('n', '<leader>dr', ":lua require('dap').repl.open({}, 'vsplit')<CR><C-w>la", { noremap = true })

      api.nvim_set_keymap('n', 'J', ":lua require('debug-helper').step_over({ fallback = 'J' })<CR>", { noremap = true })
      api.nvim_set_keymap('n', 'L', ":lua require('debug-helper').step_into({ fallback = 'L' })<CR>", { noremap = true })
      api.nvim_set_keymap('n', 'K', ":lua require('debug-helper').step_out({ fallback = 'K' })<CR>", { noremap = true })

      api.nvim_create_user_command('DebugNeovimLua', function()
        if vim.bo.filetype == 'lua' then
          pcall(require('osv').run_this)
        end
      end, {})
    end,
  },

  {
    dir = '~/.dotfiles/nvim-plugins/debug-helper.nvim',
    name = 'debug-helper',
    lazy = true,
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    event = 'VeryLazy',
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      dapui.setup({
        layouts = {
          {
            elements = {
              'scopes',
              'breakpoints',
              'stacks',
              'watches',
            },
            size = 80,
            position = 'left',
          },
          {
            elements = {
              'repl',
              'console',
            },
            size = 10,
            position = 'bottom',
          },
        },
      })

      dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
      dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
      dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end
    end,
  },
}
