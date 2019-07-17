call plug#begin('~/.config/nvim/plugged')

" UI
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'jacoborus/tender.vim'

" Navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'justinmk/vim-sneak'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-startify'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Statusline
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'tpope/vim-fugitive'

" JS support
Plug 'moll/vim-node'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'w0rp/ale'

" Tags
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Misc
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'janko-m/vim-test'
Plug 'benmills/vimux'
Plug 'brooth/far.vim'

" Languages support
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'neovimhaskell/haskell-vim'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'vim-ruby/vim-ruby'

" LSP
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }

call plug#end()


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
let g:dracula_colorterm=0
let g:fzf_history_dir='~/.local/share/fzf-history'
let g:rustfmt_autosave=1
let g:javascript_plugin_flow=1
let g:sneak#label=1
colorscheme tender

let $MYVIMRC = '$HOME/.config/nvim/init.vim'
let mapleader = ','

inoremap jj <Esc>
nnoremap <Space> :
nnoremap \ ,


if !exists('g:syntax_on')
  syntax enable
endif


" Deoplete configs
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" LSP configs
let g:LanguageClient_serverCommands = {
      \ 'rust': [ 'rustup', 'run', 'stable', 'rls' ],
      \ 'javascript': [ 'flow', 'lsp' ],
      \ 'javascript.jsx': [ 'flow', 'lsp' ],
      \ 'reason': [ 'reason-language-server.exe' ],
      \ }
nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>


" Statusline configs
let g:lightline = {}
let g:lightline.colorscheme = 'tender'
let g:lightline.component_function = {
      \ 'gitbranch': 'fugitive#head',
      \ 'gutentags': 'gutentags#statusline'
      \ }
let g:lightline.component_expand = {
      \ 'linter_checking': 'lightline#ale#checking',
      \ 'linter_warnings': 'lightline#ale#warnings',
      \ 'linter_errors': 'lightline#ale#errors',
      \ 'linter_ok': 'lightline#ale#ok'
      \ }
let g:lightline.component_type = {
      \ 'linter_checking': 'left',
      \ 'linter_warnings': 'warning',
      \ 'linter_errors': 'error',
      \ 'linter_ok': 'left'
      \ }
let g:lightline.active = {
      \ 'left': [
      \   [ 'mode', 'paste' ],
      \   [ 'gitbranch', 'readonly', 'filename', 'modified' ]
      \ ],
      \ 'right': [
      \   [ 'lineinfo' ],
      \   [ 'percent' ],
      \   [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \   [ 'gutentags' ]
      \ ]
      \ }


" Toggle NERDTree
let NERDTreeShowHidden = 1
function! OpenNerdTree()
  if &modifiable && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
  else
    NERDTreeToggle
  endif
endfunction
nnoremap <silent> <C-\> :call OpenNerdTree()<CR>


" Toggle Tagbar
nnoremap <silent> <C-[> :TagbarToggle<CR>


" Commenter configs
let g:NERDCompactSexyComs = 1
let g:NERDSpaceDelims = 1


" FZF configs
nnoremap <leader>p :Files!<CR>
nnoremap <leader>b :Buffers!<CR>
nnoremap <leader>f :Ag!<CR>
nnoremap <silent> <leader>w :Ag! <C-R><C-W><CR>


" Prettier configs
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue PrettierAsync


" Ale configs
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_linters = {
      \ 'javascript': [ 'eslint', 'flow' ]
      \ }
nmap <silent> <leader>aj :ALENext<CR>
nmap <silent> <leader>ak :ALEPrevious<CR>


" Vim sneak configs
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T


" Gutentags configs
" Require universal-ctags
let g:gutentags_ctags_exclude = [ '*.min.js', '*.min.css', 'build', 'vendor', '.git', 'node_modules', '*.vim/bundle/*' ]
let g:gutentags_define_advanced_commands = 1
augroup MyGutentagsStatusLineRefresher
  autocmd!
  autocmd User GutentagsUpdating call lightline#update()
  autocmd User GutentagsUpdated call lightline#update()
augroup END


" Haskell
let g:haskell_indent_if = 3
let g:haskell_indent_let = 4
let g:haskell_indent_guard = 2


" Rust racer
au FileType rust nmap <leader>rx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>rd <Plug>(rust-doc)


" Run test
let g:test#strategy = 'vimux'
let g:test#javascript#jest#executable = 'yarn test'
let g:VimuxUseNearest = 0
let g:VimuxOrientation = 'h'
map <leader>vq :VimuxCloseRunner<CR>
map <leader>vz :VimuxZoomRunner<CR>


" Find and replace
let g:far#source = 'rg'


" Edit and source configs
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>


" Yank full path of current buffer
nnoremap <leader>cp :let @+=expand('%:p')<CR>


" Go file vertical
nnoremap <leader>gf <C-w>vgf


" Tmux navigation
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>


" Disable arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>


" Operator Mono Lig
hi htmlArg gui=italic
hi Comment gui=italic
hi Type    gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type    cterm=italic


" Visual bg color for Tender
hi Visual  ctermbg=240


" Startify configs
let g:startify_custom_header = [
      \ "        .          .        ",
      \ "      ';;,.        ::'      ",
      \ "    ,:::;,,'       :ccc,    ",
      \ "   ,::c::,,,,.     :cccc,   ",
      \ "   ,cccc:;;;;;.    cllll,   ",
      \ "   ,cccc;.;;;;;,   cllll;   ",
      \ "   ;cccc; .;;;;;;. coooo;   ",
      \ "   ;llll;   ,:::::'loooo;   ",
      \ "   ;llll:    ':::::loooo:   ",
      \ "   :oooo:     .::::llodd:   ",
      \ "   .;ooo:       ;cclooo:.   ",
      \ "     .;oc        'coo;.     ",
      \ "       .'         .,.       ",
      \ ]

