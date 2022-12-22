-- ----------------------
-- Install plugin manager

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        '--single-branch',
        'https://github.com/folke/lazy.nvim.git',
        lazypath,
    }
end
vim.opt.runtimepath:prepend(lazypath)

-- Define leader key
vim.g.mapleader = ' '

require('lazy').setup ({
    -- Git plugins
    'lewis6991/gitsigns.nvim',
    'tpope/vim-fugitive',

    -- tmux
    'edkolev/tmuxline.vim',
    'christoomey/vim-tmux-navigator',

    -- Firenvim
         {
             'glacambre/firenvim',
             build = function()
                 vim.fn['firenvim#install'](0)
             end,
         },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },

    -- LSP
    'neovim/nvim-lspconfig',

    -- Cool
    'dundargoc/nvim-cool',

    -- AnsiEsc mostly for github logs
    'powerman/vim-plugin-AnsiEsc',

    -- Editorconfig
    'gpanders/editorconfig.nvim',

    -- Fast commenting
    'tpope/vim-commentary',

    'tpope/vim-surround',

    -- Save last cursor position in file
    'farmergreg/vim-lastplace',

    -- Themes
    {
        'dracula/vim',
        name = 'dracula',
    },
    'owozsh/amora',
    'tomasr/molokai',
    'sjl/badwolf',
    'TroyFletcher/vim-colors-synthwave',
    'Badacadabra/vim-archery',
    'mhartington/oceanic-next',
    'bluz71/vim-moonfly-colors',
    'folke/tokyonight.nvim',
    'morhetz/gruvbox',
    'navarasu/onedark.nvim',
},{
  lockfile = vim.fn.stdpath("state") .. "lazy/lazy-lock.json",
})

-- ----------------------
-- Helper function

-- Helper function to create command line abbreviations with wanted behavior.
-- This will only change a command if it's at the start of the command line.
vim.cmd [[
function! Cabbrev(lhs, rhs) abort
  exe printf("cnoreabbrev <expr>%s (getcmdtype()==#':'&&getcmdline()==#'%s')?'%s':'%s'",
    \ a:lhs, a:lhs, a:rhs, a:lhs)
endfunction
]]

-- ----------------------
-- Themes

-- colorscheme molokai
-- highlight Folded ctermfg=204

-- colorscheme synthwave
-- highlight Folded ctermfg=204
-- highlight Folded ctermbg=000

-- colorscheme badwolf
-- colorscheme moonfly
-- colorscheme amora
-- colorscheme archery
-- colorscheme OceanicNext
-- colorscheme dracula
vim.cmd.colorscheme 'tokyonight'
-- colorscheme gruvbox

--let g:onedark_config = { 'style': 'deep', }
--colorscheme onedark

-- ------------------------------------
-- Custom commands

vim.cmd [[
nnoremap <c-z> <nop>

" Define leader key
" let g:mapleader = ' '

" ------------------------------------
" Abbreviations

" Replace "write" with "update"
call Cabbrev('wq', 'x')
call Cabbrev('w', 'up')

" Git fugitive
call Cabbrev('gb', 'G blame')
call Cabbrev('gs', 'Gitsigns')

" Plugin
call Cabbrev('lazy', 'Lazy')

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
]]
