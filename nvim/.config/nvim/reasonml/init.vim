" Refresh when file changes on disk
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
set updatetime=500

set number
set lazyredraw
set scrolloff=10
syntax off

inoremap jj <Esc>
nnoremap <Space> :
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

