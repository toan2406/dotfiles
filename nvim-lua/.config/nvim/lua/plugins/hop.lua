require('hop').setup({})

vim.api.nvim_set_keymap('n', 's', ':HopChar2AC<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'S', ':HopChar2BC<CR>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<Tab>', ':HopWord<CR>', {noremap = true})

vim.cmd [[autocmd ColorScheme * highlight HopNextKey  guifg=#282828 guibg=#fabd2f gui=bold]]
vim.cmd [[autocmd ColorScheme * highlight HopNextKey1 guifg=#282828 guibg=#fabd2f gui=bold]]
vim.cmd [[autocmd ColorScheme * highlight HopNextKey2 guifg=#282828 guibg=#fabd2f gui=bold]]

