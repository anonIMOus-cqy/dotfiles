" Vim-plug {{{
call plug#begin('~/.config/nvim/plugged')
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvimvim-airline/vim-airline'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-dispatch'
Plug 'dag/vim-fish'
Plug 'vim-latex/vim-latex'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'tpope/vim-sensible'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rakr/vim-two-firewatch'
Plug 'mhinz/neovim-remote'
Plug 'autozimu/LanguageClient-neovim'
Plug 'flazz/vim-colorschemes'
Plug 'Nequo/vim-allomancer'
call plug#end()
" }}}
" Plugins {{{
" Vim-LaTeX {{{
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_SmartKeyQuote=0
nmap <localleader>l :redraw!<cr>
" }}}
" Airline {{{
" Required
set laststatus=2
let g:airline_powerline_fonts = 1

let g:airline_skip_empty_sections = 1
let g:airline#extensions#coc#enabled = 1
" }}}
" bufferline {{{
let g:bufferline_echo = 0
" }}}
" NERDTree {{{
nnoremap <C-t> :NERDTreeToggle<CR>
" }}}
" Ale {{{
let g:ale_linters = {
\   'javascript': ['standard'],
\}
" }}}
" {{{ Tagbar
nmap <F8> :TagbarToggle<CR>
"}}}
" {{{ vimtex
let g:vimtex_compiler_progname = 'nvr'
" }}}
" {{{ coc.nvim
autocmd FileType json syntax match Comment +\/\/.\+$+
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Use C to open coc config
call SetupCommandAbbrs('C', 'CocConfig')
" Bash language server
let g:LanguageClient_serverCommands = {
    \ 'sh': ['bash-language-server', 'start']
    \ }

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Close the preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
" }}}
" }}}
" General {{{
" Basic options {{{

set history=1000
set modelines=0
set hidden
set ruler
set showmode
set showcmd
set visualbell
set backspace=indent,eol,start
set number
set relativenumber
set ttyfast
set lazyredraw
set showmatch
set matchtime=3
set shell=/bin/bash
set splitbelow
set splitright
set notimeout
set nottimeout
set shiftround
set autoread
set title
set linebreak
set mouse=a
set nojoinspaces

" }}}
" Appearance {{{
set termguicolors
set background=dark " or light if you prefer the light version
" let g:two_firewatch_italics=1
colo allomancer

let g:airline_theme='luna' " if you have Airline installed and want the associated theme

syntax on
filetype plugin indent on
set modeline
set modelines=5

set encoding=utf-8
setglobal fileencoding=utf-8

set conceallevel=2

set foldmethod=marker

"}}}
" Leader {{{

let mapleader = ","
let maplocalleader = "\\"

" }}}
" Easier file manipulations{{{

inoremap <leader>w <esc>:w<cr>a
" inoremap <leader>q <esc>:q!<cr>
" inoremap <leader>z <esc>:wq!<cr>

vnoremap <leader>w <esc>:w<cr>
" vnoremap <leader>q <esc>:q!<cr>
" vnoremap <leader>z <esc>:wq!<cr>

nnoremap <leader>w :w<cr>
" nnoremap <leader>q :q!<cr>
" nnoremap <leader>z :wq!<cr>

nnoremap <leader>e :w!<cr>:e %:h<cr>
nnoremap <leader>so :so ~/.vimrc<cr>

inoremap <localleader>\ \\

command! W :w !sudo tee %
" }}}
" }}}
" Options {{{
" Scrolling {{{

set scrolloff=3
set sidescroll=1
set sidescrolloff=10

" }}}
" Show invisible char {{{

set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·
set showbreak=↪
hi NonText ctermfg=244
hi SpecialKey ctermfg=244

" }}}
" Tab, spaces, wrapping options {{{

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set wrap
set textwidth=50
set colorcolumn=+1
set formatoptions=qrn1

" }}}
" Wildmenu {{{

set wildmenu
set wildmode=list:longest

" Ignore
set wildignore+=*.aux,*.out,*.toc               " Latex
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg  " binary images
set wildignore+=*.sw?                           " Vim swap files
set wildignore+=*.DS_Store                      " OSX

" }}}
" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="
" Line Return {{{

" Makes Vim return to the same line when you reopen a file.
if has("autocmd")
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \ exe "normal! g'\"" |
        \ endif
endif

" }}}
" Backups {{{

set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backup
set noswapfile

au BufWritePre * let &bex = '-' . substitute(expand('%:p:h'),'[\,/]','%','g') . strftime("(%d%m%y)%Hh%M") . '~' | " fixes backup//
" au BufWritePre * let &bex = '-' . strftime("%Y%m%d-%H%M%S") . '.vimbackup'

" Undo sentence
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" }}}
" Search {{{

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set gdefault

" Keep search in the middle
nnoremap n nzzzv
nnoremap N Nzzzv

" Not move when *
nnoremap * *<c-o>

noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Tab to match
map <tab> %

" Open a Quickfix window for the last search
nnoremap <silent> <leader>/ :execute 'vimgrep /'.@/.'/g %'<CR>:copen<CR>

" See next/prev
nnoremap <c-n> :cn<cr>
nnoremap <c-p> :cp<cr>

" Visual mode * {{{

function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction

vnoremap * :<c-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<c-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" }}}

" }}}
" Navigation {{{

" Easier to use
nnoremap H ^
nnoremap L g_

" split screen navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" Easy split
noremap <leader>v <c-w>v

" hahaa
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

set virtualedit+=block

" }}}
" Highlight word {{{

nnoremap <silent> <leader>hh :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h1 :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>

" }}}
" Folding {{{

nnoremap <space> za
vnoremap <space> za

nnoremap <leader>Z zMzvzz

" }}}
" Yank and paste to clipboard
set clipboard=unnamed
vnoremap <C-c> "+y
nnoremap <C-p> "+p
vnoremap <C-p> "+p
" Cancer
vnoremap K k
" Increment ordered list
"inoremap <leader><cr> <esc>Yp<c-a>elC
" Cool Shell command {{{

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction

nnoremap <leader>s :Shell

" }}}
" }}}
" Quick edit {{{

nnoremap <leader>ev <c-w>s<c-w>j<c-w>L:e $MYVIMRC<cr>
nnoremap <leader>eg <c-w>s<c-w>j<c-w>L:e ~/.gvimrc<cr>
nnoremap <leader>ee <c-w>s<c-w>j<c-w>L:Ex<cr>

" }}}
" Languages {{{

"Make calcurse notes markdown compatible
autocmd BufRead,BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead,BufNewFile ~/.calcurse/notes/* set filetype=markdown

" }}}
" Idiot proof {{{

" nnoremap :w :exe "silent !echo \"Retard Alert \"" \| wq
" nnoremap :w :exe "silent !i3-nagbar -t warning -m \"Retard Alert\"" \| wq
" nnoremap :w :exe "silent !i3lock-fancy" \| wq
" nnoremap :q :exe "silent !~/.config/i3/lock.sh" \| q

" }}}
