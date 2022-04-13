" ----------------------
" Install packer
let install_path = stdpath("data") . "/site/pack/packer/start/packer.nvim"

if empty(glob(install_path)) > 0
  execute("!git clone https://github.com/wbthomason/packer.nvim " . install_path)
endif

" ----------------------
" Themes

" colorscheme molokai
" highlight Folded ctermfg=204

" colorscheme synthwave
" highlight Folded ctermfg=204
" highlight Folded ctermbg=000

" colorscheme badwolf
" colorscheme onehalfdark
" colorscheme purify
" colorscheme moonfly
" colorscheme amora
" colorscheme archery
" colorscheme OceanicNext
" colorscheme dracula
" colorscheme tokyonight
" colorscheme gruvbox
colorscheme catppuccin

" ------------------------------------
" Custom commands

nnoremap <C-Z> <NOP>

" Disable adding an extra comment on the new line when pressing "o"
map <buffer> \c :set formatoptions-=cro<Enter>

" ------------------------------------
" Abbreviations

" Replace "write" with "update"
cabbrev wq x
cabbrev w up

" Git fugitive
cabbrev gb G blame
cabbrev gs G status

" Packer
cabbrev ps PackerSync

"------------------------------------
" Other

" Nicer terminal mappings
tnoremap <esc> <C-\><C-n>
autocmd TermOpen * startinsert

" Disable firenvim by default
let g:firenvim_config = {'globalSettings': {},'localSettings': {'.*': {'takeover': 'never'},},}

" Disable providers
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_python3_provider = 0

" ------------------------------------
" Options

set clipboard+=unnamedplus

set autoindent
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

" Use single global status at the bottom
set laststatus=3

" Fold max number of identical lines when diffing
set diffopt=filler,context:1
