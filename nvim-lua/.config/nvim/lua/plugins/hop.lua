require('hop').setup({})

vim.api.nvim_set_keymap('n', 's', ':HopChar2AC<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'S', ':HopChar2BC<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Tab>', ':HopWord<CR>', {noremap = true})

