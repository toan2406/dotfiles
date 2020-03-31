call plug#begin('~/.config/nvim/plugged')

" UI
Plug 'jacoborus/tender.vim'
Plug 'andreypopp/vim-colors-plain'

" Navigation
Plug 'justinmk/vim-sneak'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vifm/vifm.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Statusline
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" LSP
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'neoclide/coc-json', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-tsserver', { 'do': 'yarn install --frozen-lockfile' }

" JS support
Plug 'moll/vim-node'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'w0rp/ale'

" Languages support
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'neovimhaskell/haskell-vim'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'vim-ruby/vim-ruby'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'rbgrouleff/bclose.vim'
Plug 'iberianpig/tig-explorer.vim'

" Misc
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/gv.vim'
Plug 'janko-m/vim-test'
Plug 'benmills/vimux'
Plug 'brooth/far.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'psliwka/vim-smoothie'

call plug#end()


set hidden
set nomodeline
set noswapfile
set hlsearch
set incsearch
set ignorecase
set smartcase
set ruler
set number
set relativenumber
set splitright
set splitbelow
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set colorcolumn=80
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
set list
set scrolloff=10
set regexpengine=1
set completeopt-=preview
set clipboard+=unnamedplus
set lazyredraw
set termguicolors
set background=dark


let $MYVIMRC = '$HOME/.config/nvim/init.vim'
let $VIMSCRATCH = '$HOME/.config/nvim/scratch.vim'
let mapleader = ','


inoremap jj <Esc>
nnoremap <Space> :
nnoremap \ ,


" Disable arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>


" Key bindings
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>
nnoremap <silent> <leader>sb :topleft 15 new $VIMSCRATCH<CR>
nnoremap <leader>cp :let @+=expand('%:p')<CR>
nnoremap <leader>gf <C-w>vgf


" UI
colorscheme tender

if !exists('g:syntax_on')
  syntax enable
endif

hi! Search guifg=white guibg=NONE gui=underline,bold
hi! IncSearch guifg=white guibg=NONE
hi! Visual guibg=#585858
hi! CocFloating guibg=#333333 guifg=white
hi! Pmenu guibg=#333333 guifg=white


" Vifm
nnoremap <silent> <C-\> :Vifm<CR>


" Auto Pairs
au Filetype reason let b:AutoPairs = {'(':')', '[':']', '{':'}', '"':'"'}


" Coc configs
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <C-Space> coc#refresh()
nnoremap <leader>lj :call CocAction('jumpDefinition')<CR>
nnoremap <leader>lf :call CocAction('format')<CR>
nnoremap <leader>lh :call CocAction('doHover')<CR>
nnoremap <leader>ld :call CocAction('diagnosticPreview')<CR>


" Statusline configs
let g:lightline = {}
let g:lightline.colorscheme = 'tender'
let g:lightline.component_function = {
      \ 'gitbranch': 'fugitive#head'
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
      \   [ 'gitbranch', 'readonly', 'filename', 'filetype', 'modified' ]
      \ ],
      \ 'right': [
      \   [ 'lineinfo' ],
      \   [ 'percent' ],
      \   [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]
      \ ]
      \ }


" Commenter configs
let g:NERDCompactSexyComs = 1
let g:NERDSpaceDelims = 1


" FZF configs
let g:fzf_history_dir = '~/.local/share/fzf-history'
nnoremap <leader>p :Files!<CR>
nnoremap <leader>b :Buffers!<CR>
nnoremap <leader>f :Rg!<CR>
nnoremap <silent> <leader>w :Rg!<C-R><C-W><CR>
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case --hidden '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('right:50%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


" Prettier configs
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue PrettierAsync


" Ale configs
let g:ale_reason_ls_executable = '/usr/local/bin/reason-language-server.exe'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 0
let g:ale_linters = {
      \ 'javascript': [ 'eslint', 'flow' ],
      \ 'reason': [ 'reason-language-server' ]
      \ }
nmap <silent> <leader>aj :ALENext<CR>
nmap <silent> <leader>ak :ALEPrevious<CR>


" Vim sneak configs
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T


" Haskell
let g:haskell_indent_if = 3
let g:haskell_indent_let = 4
let g:haskell_indent_guard = 2


" Rust
let g:rustfmt_autosave = 1
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


" Tmux navigation
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>


" Color highlighter
lua require'colorizer'.setup()


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


" Spotify in floating window
command! Spotify :call SpotifyFloatingWin()
function! SpotifyFloatingWin()
  call OpenFloatingWin()

  terminal ncmpcpp
  startinsert
  autocmd TermClose * ++once :q
endfunction


" ReasonML in floating window
command! RePlayground :call RePlaygroundFloatingWin()
function! RePlaygroundFloatingWin()
  call OpenFloatingWin()

  call termopen("cd $HOME/.config/nvim/reasonml && nvim -u playground.vim -O Reason.re Javascript.js")
  startinsert
  autocmd TermClose * ++once :q
endfunction


function! OpenFloatingWin()
  let height = float2nr((&lines - 2) * 0.8)
  let width = float2nr(&columns * 0.8)
  let row = float2nr((&lines - height) / 2)
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': row,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  hi FloatingWinNormal ctermbg=black guibg=#333333
  call setwinvar(win, '&winhl', 'Normal:FloatingWinNormal')
  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction


" Misc
let g:bclose_no_plugin_maps = 1


" Start screen
function! Start()
  if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
    return
  endif

  enew

  setlocal
        \ bufhidden=wipe
        \ buftype=nofile
        \ nocursorcolumn
        \ nocursorline
        \ nolist
        \ nonumber
        \ noswapfile
        \ norelativenumber
        \ colorcolumn=""

  let l:logo_height = len(g:startify_custom_header)
  let l:logo_width = len(g:startify_custom_header[0])
  let l:row = float2nr((&lines - l:logo_height - 4) / 2)
  let l:col = float2nr((&columns - l:logo_width) / 2)

  call append('$', map(range(l:row), '""'))
  for line in g:startify_custom_header
    call append('$', repeat(" ", l:col) . l:line)
  endfor

  setlocal nomodifiable nomodified
  setlocal statusline=%#Normal#

  nnoremap <buffer><silent> e :enew<CR>
  nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
  nnoremap <buffer><silent> o :enew <bar> startinsert<CR>
  nnoremap <buffer><silent> a :enew <bar> startinsert<CR>
endfunction

autocmd VimEnter * call Start()

