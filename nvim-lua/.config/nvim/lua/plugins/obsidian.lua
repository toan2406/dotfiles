local api = vim.api

require('obsidian').setup({
  directory = '~/Workspace/Personal/my-second-brain'
})

api.nvim_set_keymap('n', '<leader>zc', ':Capture ', {noremap = true})

