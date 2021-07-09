local g = vim.g
local api = vim.api

g.fzf_history_dir = '~/.local/share/fzf-history'

vim.cmd [[command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case --hidden -- '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)]]

api.nvim_set_keymap('n', '<leader>ff', ':Files!<CR>', {noremap = true})
api.nvim_set_keymap('n', '<leader>fg', ':Rg!<CR>', {noremap = true})
api.nvim_set_keymap('n', '<leader>fb', ':Buffers!<CR>', {noremap = true})
api.nvim_set_keymap('n', '<leader>fw', ':Rg!<C-R><C-W><CR>', {noremap = true})

api.nvim_set_keymap('n', '<leader>p', '<leader>ff', {noremap = false})
api.nvim_set_keymap('n', '<leader>s', '<leader>fg', {noremap = false})
api.nvim_set_keymap('n', '<leader>b', '<leader>fb', {noremap = false})
api.nvim_set_keymap('n', '<leader>w', '<leader>fw', {noremap = false})

