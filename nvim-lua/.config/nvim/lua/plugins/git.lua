return {
  {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>gg', ':Git<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>gb', ':Git blame<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>ge', ':Gedit<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>gd', ':Gdiffsplit<CR>', { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap('n', '<leader>gl', ':0Gclog<CR>', { noremap = true, silent = true })
    end,
  },

  {
    'tpope/vim-rhubarb',
    event = 'BufRead',
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>go', 'V:GBrowse<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('v', '<leader>go', ':GBrowse<CR>', { noremap = true, silent = true })
    end,
  },

  {
    'junegunn/gv.vim',
    dependencies = {
      'tpope/vim-fugitive',
      'tpope/vim-rhubarb',
    },
    event = 'BufRead',
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>gl', ':GV?<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>gv', ':GV!<CR>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('v', '<leader>gv', ':GV<CR>', { noremap = true, silent = true })

      vim.api.nvim_create_user_command('GPulls', function()
        local root = vim.call('rhubarb#HomepageForUrl', vim.fn.FugitiveRemoteUrl())
        local sha = vim.call('gv#sha')
        local url = root .. '/pulls?q=is%3Apr+hash%3A' .. sha

        vim.cmd('GBrowse ' .. url)
      end, {})

      local group = vim.api.nvim_create_augroup('GVGroup', { clear = true })
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'GV',
        group = group,
        callback = function()
          vim.api.nvim_buf_set_keymap(0, 'n', 'gp', ':GPulls<CR>', { noremap = true, silent = true })
        end,
      })
    end,
  },

  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    event = 'BufRead',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
      },
      signs_staged = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '┆' },
      },
      numhl = false,
      linehl = false,
    },
  },
}
