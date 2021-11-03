local api = vim.api

require('obsidian').setup({
  directory = '~/Workspace/Personal/my-second-brain'
})

api.nvim_set_keymap('n', '<leader>zn', ':Capture ', {noremap = true})
api.nvim_set_keymap('n', '<leader>zs', ':Screenshot<CR>', {noremap = true})
api.nvim_set_keymap('n', '<leader>zi', ':LinkNote<CR>', {noremap = true})

