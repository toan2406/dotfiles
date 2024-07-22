require('copilot').setup({
  suggestion = {
    enabled = false,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = '¬',
      accept_word = false,
      accept_line = false,
      next = '∆',
      prev = '˚',
      dismiss = '<C-]>',
    },
  },
  panel = {
    enabled = false,
  },
  filetypes = {
    ['*'] = false,
  },
  copilot_node_command = vim.fn.expand('$HOME') .. '/.nvm/versions/node/v20.10.0/bin/node',
})

require('copilot_cmp').setup()

