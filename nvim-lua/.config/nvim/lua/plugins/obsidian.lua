local api = vim.api

require('obsidian').setup({
  directory = '~/Workspace/Personal/my-second-brain'
})

api.nvim_set_keymap('n', '<leader>zn', ':ZCapture ', {noremap = true})
api.nvim_set_keymap('n', '<leader>zs', ':ZScreenshot<CR>', {noremap = true})
api.nvim_set_keymap('n', '<leader>zi', ':ZLinkNote<CR>', {noremap = true})

