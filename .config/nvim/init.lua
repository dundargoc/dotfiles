-- Install plugin manager

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        '--single-branch',
        'https://github.com/folke/lazy.nvim.git',
        lazypath,
    })
end
vim.opt.runtimepath:prepend(lazypath)

-- Define leader key
vim.g.mapleader = ' '

require('lazy').setup({
    {
        'williamboman/mason.nvim',
        build = ':MasonUpdate',
        config = true,
    },
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
    {
        'powerman/vim-plugin-AnsiEsc',
        cmd = 'AnsiEsc',
    },
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
    'Badacadabra/vim-archery',
    'mhartington/oceanic-next',
    'bluz71/vim-moonfly-colors',
    'folke/tokyonight.nvim',
    'morhetz/gruvbox',
    'navarasu/onedark.nvim',
}, {
    lockfile = vim.fn.stdpath('state') .. 'lazy/lazy-lock.json',
})

-- Helper functions

-- Create command line abbreviations with wanted behavior.
-- This will only change a command if it's at the start of the command line.
vim.cmd([[
function! Cabbrev(lhs, rhs) abort
  exe printf("cnoreabbrev <expr>%s (getcmdtype()==#':'&&getcmdline()==#'%s')?'%s':'%s'",
    \ a:lhs, a:lhs, a:rhs, a:lhs)
endfunction
]])

-- Themes

vim.cmd.colorscheme('molokai')
-- vim.cmd.colorscheme('badwolf')
-- vim.cmd.colorscheme('moonfly')
-- vim.cmd.colorscheme('amora')
-- vim.cmd.colorscheme('archery')
-- vim.cmd.colorscheme('OceanicNext')
-- vim.cmd.colorscheme('dracula')
-- vim.cmd.colorscheme('tokyonight')
-- vim.cmd.colorscheme('gruvbox')

-- vim.g.onedark_config = { style = 'deep' }
-- vim.cmd.colorscheme('onedark')

-- Custom commands

vim.keymap.set('n', '<c-z>', '<nop>')

-- Abbreviations

vim.cmd([[
" Replace "write" with "update"
call Cabbrev('wq', 'x')
call Cabbrev('w', 'up')

" Git fugitive
call Cabbrev('gb', 'G blame')
call Cabbrev('gs', 'Gitsigns')

" Plugin
call Cabbrev('lazy', 'Lazy')
]])

-- Other

-- Nicer terminal mappings
vim.api.nvim_create_autocmd({ 'TermOpen' }, {
    command = 'startinsert',
})
vim.keymap.set('t', '<esc>', '<c-\\><c-n>')

-- Disable providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0

-- Options
vim.o.shiftwidth = 4
vim.o.softtabstop = -1

-- Make tabs spaces - required for neovim development
vim.o.expandtab = true

vim.o.ignorecase = true
vim.o.smartcase = true

-- Enable true colors.
vim.o.termguicolors = true

-- Set default font and font size for GUI.
vim.o.guifont = 'Fira Code:h11'

-- Enable persistent undo
vim.o.undofile = true

-- Disable timeout
vim.o.timeout = false

-- Split right and below
vim.o.splitbelow = true
vim.o.splitright = true

vim.cmd([[
set listchars+=tab:<->

" Disable autopreview when using omnicompletion
set completeopt-=preview

" Fold max number of identical lines when diffing
set diffopt=filler,context:1
]])

-- Clipboard
vim.keymap.set({ 'n', 'x' }, '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+y$')
vim.keymap.set({ 'n', 'x' }, '<leader>p', '"+p')
vim.keymap.set({ 'n', 'x' }, '<leader>P', '"+P')
vim.keymap.set({ 'n', 'x' }, '<leader>gp', '"+gp')
vim.keymap.set({ 'n', 'x' }, '<leader>gP', '"+gP')

-- Plugin configuration

-- Disable firenvim by default
vim.g.firenvim_config = { globalSettings = {}, localSettings = { ['.*'] = { takeover = 'never' } } }
