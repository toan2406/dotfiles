local api = vim.api

api.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = false})
api.nvim_set_keymap('n', '<Space>', ':', {noremap = true})
api.nvim_set_keymap('n', '<Esc>', ':noh<CR>', {noremap = true})

-- Behave Vim
api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true})

-- Keeping it centered
api.nvim_set_keymap('n', 'n', 'nzzzv', {noremap = true})
api.nvim_set_keymap('n', 'N', 'Nzzzv', {noremap = true})
-- api.nvim_set_keymap('n', 'J', 'mzJ`z', {noremap = true})
api.nvim_set_keymap('n', '[l', ':lprevious<CR>zzzv', {noremap = true})
api.nvim_set_keymap('n', ']l', ':lnext<CR>zzzv', {noremap = true})
api.nvim_set_keymap('n', '[q', ':cprevious<CR>zzzv', {noremap = true})
api.nvim_set_keymap('n', ']q', ':cnext<CR>zzzv', {noremap = true})

-- Undo break points
api.nvim_set_keymap('i', '.', '.<C-g>u', {noremap = true})

-- Jumplist mutations
api.nvim_set_keymap('n', 'k', "(v:count > 5 ? \"m'\" . v:count : \"\") . 'k'", {noremap = true, expr = true})
api.nvim_set_keymap('n', 'j', "(v:count > 5 ? \"m'\" . v:count : \"\") . 'j'", {noremap = true, expr = true})

-- Highlight word without jumping
api.nvim_set_keymap('n', '*', ':let @/=\'\\<<C-R>=expand("<cword>")<CR>\\>\'<CR>:set hls<CR>', {noremap = true})

-- Moving text
-- api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", {noremap = true})
-- api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", {noremap = true})

-- Edit macros ("q<leader>m)
api.nvim_set_keymap('n', '<leader>m', ":<C-u><C-r><C-r>='let @' . v:register . ' = ' . string(getreg(v:register))<CR><C-f><left>", {noremap = true})

api.nvim_set_keymap('n', '<leader>cp', ":let @+=expand('%:p')<CR>", {noremap = true})
api.nvim_set_keymap('n', '<leader><leader>', '<C-^>', {noremap = true})
api.nvim_set_keymap('n', '<leader>gf', '<C-w>vgf', {noremap = true})
vim.cmd [[autocmd User Rails nmap <buffer> <leader>gf :vert sfind <Plug><cfile><CR>]]
vim.cmd [[autocmd User Rails nmap <buffer><silent> gf :find <Plug><cfile><CR>]]

