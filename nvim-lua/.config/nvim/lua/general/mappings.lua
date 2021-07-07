local api = vim.api
local MYVIMRC = '$HOME/.config/nvim/init.lua'

api.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = false})
api.nvim_set_keymap('n', '<Space>', ':', {noremap = true})

api.nvim_set_keymap('n', '<leader>vc', ':e $MYVIMRC<CR>', {noremap = true, silent = true})

api.nvim_set_keymap('n', '<leader>cp', ":let @+=expand('%:p')<CR>", {noremap = true})
api.nvim_set_keymap('n', '<leader>gf', '<C-w>vgf', {noremap = true})
api.nvim_set_keymap('n', '<leader><leader>', '<C-^>', {noremap = true})

