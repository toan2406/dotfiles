return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept_word = false,
          accept_line = false,
          accept = '¬', -- <M-l>
          next = '∆', -- <M-j>
          prev = '˚', -- <M-k>
          dismiss = '<C-]>',
        },
      },
      panel = {
        enabled = false,
      },
      filetypes = {
        javascript = true,
        typescript = true,
        typescriptreact = true,
        ['*'] = false,
      },
      copilot_node_command = vim.fn.expand('$HOME') .. '/.nvm/versions/node/v20.10.0/bin/node',
    },
  },

  {
    'zbirenbaum/copilot-cmp',
    enabled = false,
    lazy = true,
    config = true,
  },
}
