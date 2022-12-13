" ----------------------
" Install packer
let install_path = stdpath("data") . "/site/pack/packer/start/packer.nvim"

if !isdirectory(install_path)
  execute("!git clone https://github.com/wbthomason/packer.nvim " . install_path)
endif

" ----------------------
" Helper function

" Helper function to create command line abbreviations with wanted behavior.
" This will only change a command if it's at the start of the command line.
function! Cabbrev(lhs, rhs) abort
  exe printf("cnoreabbrev <expr>%s (getcmdtype()==#':'&&getcmdline()==#'%s')?'%s':'%s'",
    \ a:lhs, a:lhs, a:rhs, a:lhs)
endfunction

" ----------------------
" Themes

" colorscheme molokai
" highlight Folded ctermfg=204

" colorscheme synthwave
" highlight Folded ctermfg=204
" highlight Folded ctermbg=000

" colorscheme badwolf
" colorscheme moonfly
" colorscheme amora
" colorscheme archery
" colorscheme OceanicNext
" colorscheme dracula
colorscheme tokyonight
" colorscheme gruvbox

"let g:onedark_config = { 'style': 'deep', }
"colorscheme onedark

" ------------------------------------
" Custom commands

nnoremap <c-z> <nop>

" Define leader key
let g:mapleader = ' '

" ------------------------------------
" Abbreviations

" Replace "write" with "update"
call Cabbrev('wq', 'x')
call Cabbrev('w', 'up')

" Git fugitive
call Cabbrev('gb', 'G blame')
call Cabbrev('gs', 'Gitsigns')

" Packer
call Cabbrev('ps', 'PackerSync')

"------------------------------------
" Other

" Nicer terminal mappings
tnoremap <esc> <c-\><c-n>
autocmd TermOpen * startinsert

" Disable providers
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_python3_provider = 0

" ------------------------------------
" Options

set shiftwidth=4
set softtabstop=-1
set listchars+=tab:<->

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

" ------------------------------------
" Plugin configuration

" Disable firenvim by default
let g:firenvim_config = {'globalSettings': {},'localSettings': {'.*': {'takeover': 'never'},},}
