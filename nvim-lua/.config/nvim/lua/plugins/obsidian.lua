local api = vim.api

require('obsidian').setup({
  directory = '~/Workspace/Personal/my-second-brain'
})

api.nvim_set_keymap('n', '<leader>zc', ':Capture ', {noremap = true})
api.nvim_set_keymap('i', '<C-x><C-i>', [[
fzf#vim#complete({'source': "ls -1p ~/Workspace/Personal/my-second-brain | grep -v / | awk -F '.' '{print $1}'", 'reducer': { lines -> join(["\[\[", lines[0], "\]\]"], "") }})
]], {noremap = true, expr = true})

