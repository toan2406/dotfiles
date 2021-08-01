local api = vim.api
local MYVIMRC = '$HOME/.config/nvim/init.lua'

api.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = false})
api.nvim_set_keymap('n', '<Space>', ':', {noremap = true})

-- Behave Vim
api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true})

-- Keeping it centered
api.nvim_set_keymap('n', 'n', 'nzzzv', {noremap = true})
api.nvim_set_keymap('n', 'N', 'Nzzzv', {noremap = true})
api.nvim_set_keymap('n', 'J', 'mzJ`z', {noremap = true})

-- Undo break points
api.nvim_set_keymap('i', '.', '.<C-g>u', {noremap = true})

-- Jumplist mutations
api.nvim_set_keymap('n', 'k', "(v:count > 5 ? \"m'\" . v:count : \"\") . 'k'", {noremap = true, expr = true})
api.nvim_set_keymap('n', 'j', "(v:count > 5 ? \"m'\" . v:count : \"\") . 'j'", {noremap = true, expr = true})

-- Moving text
api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true})
api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true})

api.nvim_set_keymap('n', '<leader>vc', ':e $MYVIMRC<CR>', {noremap = true, silent = true})
api.nvim_set_keymap('n', '<leader>cp', ":let @+=expand('%:p')<CR>", {noremap = true})
api.nvim_set_keymap('n', '<leader>gf', '<C-w>vgf', {noremap = true})
api.nvim_set_keymap('n', '<leader><leader>', '<C-^>', {noremap = true})

