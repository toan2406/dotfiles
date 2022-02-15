local g = vim.g
local api = vim.api
local fn = vim.fn

fn.setenv("FZF_DEFAULT_COMMAND", "rg --files --ignore-vcs --hidden --glob '!{node_modules,.git}'")

g.fzf_history_dir = '~/.local/share/fzf-history'
g.fzf_layout = {down = '50%'}

vim.cmd [[
command! -bang -nargs=* Rg call fzf#vim#grep(
      \ 'rg --column --line-number --no-heading --color=always --smart-case --hidden -- '.shellescape(<q-args>),
      \ 1,
      \ fzf#vim#with_preview(),
      \ <bang>0
      \ )
]]

vim.cmd [[
function! s:sink(selection) abort
  exec "%bd"
  exec "cd " . a:selection
endfunction

function! s:get_source() abort
  return '{ echo "${HOME}/.dotfiles"; find $HOME/Workspace -maxdepth 2 -type d; }'
endfunction

command! Projects call fzf#run({
      \ 'source': s:get_source(),
      \ 'sink': function('s:sink'),
      \ 'down': '50%'
      \ })
]]

api.nvim_set_keymap('n', '<leader>ff', ':Files!<CR>', {noremap = true})
api.nvim_set_keymap('n', '<leader>fg', ':Rg!<CR>', {noremap = true})
api.nvim_set_keymap('n', '<leader>fb', ':Buffers!<CR>', {noremap = true})
api.nvim_set_keymap('n', '<leader>fw', ':Rg!<C-R><C-W><CR>', {noremap = true})
api.nvim_set_keymap('n', '<leader>fh', ':Helptags<CR>', {noremap = true})
api.nvim_set_keymap('n', '<leader>f/', ':History/<CR>', {noremap = true})
api.nvim_set_keymap('n', '<leader>f:', ':History:<CR>', {noremap = true})
api.nvim_set_keymap('n', '<leader>fc', ':Commands<CR>', {noremap = true})
api.nvim_set_keymap('n', '<leader>fm', ':Marks<CR>', {noremap = true})
api.nvim_set_keymap('n', '<leader>ft', ':GFiles!?<CR>', {noremap = true})
api.nvim_set_keymap('n', '<leader>fa', ':Maps<CR>', {noremap = true})
api.nvim_set_keymap('n', '<leader>fp', ':Projects<CR>', {noremap = true})

api.nvim_set_keymap('n', '<leader>p', '<leader>ff', {noremap = false})
api.nvim_set_keymap('n', '<leader>s', '<leader>fg', {noremap = false})
api.nvim_set_keymap('n', '<leader>b', '<leader>fb', {noremap = false})
api.nvim_set_keymap('n', '<leader>w', '<leader>fw', {noremap = false})

