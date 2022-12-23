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

require('lazy').setup({
    'lewis6991/gitsigns.nvim',
    'tpope/vim-fugitive',
    'edkolev/tmuxline.vim',
    'christoomey/vim-tmux-navigator',
    {
        'glacambre/firenvim',
        build = function()
            vim.fn['firenvim#install'](0)
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },
    'neovim/nvim-lspconfig',
    'dundargoc/nvim-cool',
    'powerman/vim-plugin-AnsiEsc',
    'gpanders/editorconfig.nvim',
    'tpope/vim-commentary',
    'tpope/vim-surround',
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
}, {
    lockfile = vim.fn.stdpath 'state' .. 'lazy/lazy-lock.json',
})

-- Helper functions

-- Create command line abbreviations with wanted behavior.
-- This will only change a command if it's at the start of the command line.
vim.cmd [[
function! Cabbrev(lhs, rhs) abort
  exe printf("cnoreabbrev <expr>%s (getcmdtype()==#':'&&getcmdline()==#'%s')?'%s':'%s'",
    \ a:lhs, a:lhs, a:rhs, a:lhs)
endfunction
]]

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

-- Custom commands

vim.cmd [[
nnoremap <c-z> <nop>
]]

-- Abbreviations

vim.cmd [[
" Replace "write" with "update"
call Cabbrev('wq', 'x')
call Cabbrev('w', 'up')

" Git fugitive
call Cabbrev('gb', 'G blame')
call Cabbrev('gs', 'Gitsigns')

" Plugin
call Cabbrev('lazy', 'Lazy')
]]

-- Other
vim.cmd [[

" Nicer terminal mappings
tnoremap <esc> <c-\><c-n>
autocmd TermOpen * startinsert

" Disable providers
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0
let g:loaded_python3_provider = 0
]]

-- Options
vim.cmd [[
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
]]

-- Clipboard
vim.cmd [[
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
]]

-- Plugin configuration
vim.cmd [[
" Disable firenvim by default
let g:firenvim_config = {'globalSettings': {},'localSettings': {'.*': {'takeover': 'never'},},}
]]
