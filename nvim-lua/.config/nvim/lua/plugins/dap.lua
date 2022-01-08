local dap = require('dap')

local api = vim.api
local installation_path = vim.fn.stdpath('data') .. '/dap_debuggers'

-- mkdir -p ~/.local/share/nvim/dap_debuggers && cd "$_"
-- git clone https://github.com/microsoft/vscode-node-debug2.git && cd vscode-node-debug2
-- npm install
-- npm run build
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {installation_path .. '/vscode-node-debug2/out/src/nodeDebug.js'},
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
    stdio = {nil, stdout},
    args = {'--open', '--port', config.port, '-c', '--', config.command, config.script},
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
    callback({type = 'server', host = '127.0.0.1', port = config.port})
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

vim.fn.sign_define('DapBreakpoint', {text = '●', texthl = 'GruvboxRed', linehl = '', numhl = ''})

api.nvim_set_keymap('n', '<leader>dt', ":lua require('dap').toggle_breakpoint()<CR>", {noremap = true})
api.nvim_set_keymap('n', '<leader>dq', ":lua require('dap').close()<CR>", {noremap = true})
api.nvim_set_keymap('n', '<leader>dc', ":lua require('dap').continue()<CR>", {noremap = true})
api.nvim_set_keymap('n', '<leader>dr', ":lua require('dap').repl.open({}, 'vsplit')<CR><C-w>la", {noremap = true})

api.nvim_set_keymap('n', 'J', ":lua require('debug-helper').step_over({fallback = 'J'})<CR>", {noremap = true})
api.nvim_set_keymap('n', 'L', ":lua require('debug-helper').step_into({fallback = 'L'})<CR>", {noremap = true})
api.nvim_set_keymap('n', 'K', ":lua require('debug-helper').step_out({fallback = 'K'})<CR>", {noremap = true})

