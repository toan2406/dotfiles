require('copilot').setup({
  suggestion = {
    enabled = false,
  },
  panel = {
    enabled = false,
  },
  copilot_node_command = vim.fn.expand('$HOME') .. '/.nvm/versions/node/v16.18.0/bin/node',
})

require('copilot_cmp').setup()

