set autoread
au FocusGained,BufEnter * :checktime
au CursorHold,CursorHoldI * checktime
au BufWrite,BufWritePre * checktime
autocmd BufWrite,BufWritePre * if mode() != 'c' | checktime | endif
set updatetime=500
set nomodeline
set ruler
set number
set hlsearch
set splitright
set splitbelow
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" set cursorline
" set colorcolumn=80,120
set clipboard+=unnamedplus
set hidden
set ignorecase
set smartcase
set relativenumber
set lazyredraw
set regexpengine=1
set scrolloff=10
set completeopt-=preview
set background=dark

syntax off
