" Vim 7 options that differ
set nocompatible
if has('autocmd')
  filetype plugin indent on
endif

set backspace=indent,eol,start
set encoding=utf-8
set incsearch
set nolangremap
let &nrformats="bin,hex"
set showcmd
set ruler
set wildmenu

" Vim 7, 8 options that differ
set autoindent
set autoread
set background=dark
set belloff=all
set cdpath=,.,~/src,~/
set clipboard=unnamed,unnamedplus
set cmdheight=1
set complete=.,w,b,u,t
set cscopeverbose
"set diffopt=internal,filler
set display=lastline
set fillchars=
set formatoptions=tcqj
let &keywordprg=":Man"
set nofsync
set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
set hidden
set history=10000
set hlsearch
set nojoinspaces
set laststatus=2
set listchars=tab:>\ ,trail:-,nbsp:+
set maxcombine=6
set mouse=a
set scroll=13
set scrolloff=0
set sessionoptions-=options
set shortmess=filnxtToOF
set sidescroll=1
set smarttab
set nostartofline
set tabpagemax=50
set tags=./tags;,tags
set notitle
"set switchbuf=uselast
set titleold=
set ttimeout
set ttimeoutlen=50
set ttyfast
set viewoptions-=options
let &viminfo='!,'.&viminfo
let &wildoptions="pum,tagfile"

let g:vimsyn_embed='l'

if exists('$TMUX')
  set ttymouse=xterm2

  " https://vimhelp.org/term.txt.html#xterm-true-color
  " https://gist.github.com/andersevenrud/015e61af2fd264371032763d4ed965b6
  " if tmux and not(gVim) and termguicolors
  autocmd VimEnter * if !has('gui_running') && has('termguicolors') && &termguicolors
      \| let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      \| let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    \| endif
endif


" DIRECTORIES

" These don't always necessarily exist in Neovim,
" but are convenient to have for Stdpath()

if ! exists('$XDG_CACHE_HOME')
  if has('win32')
    let $XDG_CACHE_HOME=$TEMP
  else
    let $XDG_CACHE_HOME=$HOME . '/.cache'
  endif
endif

if ! exists('$XDG_CONFIG_HOME')
  if has('win32')
    let $XDG_CONFIG_HOME=$LOCALAPPDATA
  else
    let $XDG_CONFIG_HOME=$HOME . '/.config'
  endif
endif

if ! exists('$XDG_DATA_HOME')
  if has('win32')
    let $XDG_DATA_HOME=$LOCALAPPDATA
  else
    let $XDG_DATA_HOME=$HOME . '/.local/share'
  endif
endif

" Similar to nvim's stdpath(id)
function! Stdpath(id)
  if a:id == 'data'
    if has('win32')
      return $XDG_DATA_HOME . '/nvim-data'
    else
      return $XDG_DATA_HOME . '/nvim'
    endif
  elseif a:id == 'data_dirs'
    return []
  elseif a:id == 'config'
    return $XDG_CONFIG_HOME . '/nvim'
  elseif a:id == 'config_dirs'
    return []
  elseif a:id == 'cache'
    return $XDG_CACHE_HOME . '/nvim'
  else
    throw '"' . a:id . '" is not a valid stdpath'
  endif
endfunction

let s:datadir   = Stdpath('data')
let s:configdir = Stdpath('config')

" backupdir isn't set exactly like Neovim, because it's odd.
let &backupdir = s:datadir . '/backup//'
let &viewdir   = s:datadir . '/view//'
if ! executable('nvim')
  let &directory = s:datadir . '/swap//'
  let &undodir   = s:datadir . '/undo//'
else
  " Vim/Neovim have different file formats
  let &directory = s:datadir . '/vimswap//'
  let &undodir   = s:datadir . '/vimundo//'
endif
let s:shadadir   = s:datadir  . '/shada'
let &viminfofile.= s:shadadir . '/viminfo'

" Neovim creates directories if they don't exist
function! s:MakeDirs()
  for dir in [&backupdir, &directory, &undodir, &viewdir, s:shadadir]
    call mkdir(dir, "p")
  endfor
endfunction
autocmd VimEnter * call s:MakeDirs()

""""""""""""""""""""""""""""""""""""""""""""
" Personal config 

nnoremap <c-z> <nop>

" Define leader key
let g:mapleader = ' '

" ------------------------------------
" Abbreviations

" Helper function to create command line abbreviations with wanted behavior.
" This will only change a command if it's at the start of the command line.
function! Cabbrev(lhs, rhs) abort
  exe printf("cnoreabbrev <expr>%s (getcmdtype()==#':'&&getcmdline()==#'%s')?'%s':'%s'",
    \ a:lhs, a:lhs, a:rhs, a:lhs)
endfunction

" Replace "write" with "update"
call Cabbrev('wq', 'x')
call Cabbrev('w', 'up')

" ------------------------------------
" Options

set shiftwidth=4
set softtabstop=-1

" Make tabs spaces - required for neovim development
set expandtab

set ignorecase
set smartcase

" Enable true colors.
set termguicolors

" Set default font and font size for GUI.
set guifont=Fira\ Code:h11

" Disable autopreview when using omnicompletion
set completeopt-=preview

" Fold max number of identical lines when diffing
set diffopt=filler,context:1

" Enable persistent undo
set undofile

" Disable timeout
set notimeout

" Split right and below
set splitbelow
set splitright

" ------------------------------------
" Clipboard

nnoremap <leader>y  "+y
nnoremap <leader>Y  "+y$
nnoremap <leader>p  "+p
nnoremap <leader>P  "+P
nnoremap <leader>gp "+gp
nnoremap <leader>gP "+gP
xnoremap <leader>y  "+y
xnoremap <leader>p  "+p
xnoremap <leader>P  "+P
xnoremap <leader>gp "+gp
xnoremap <leader>gP "+gP
