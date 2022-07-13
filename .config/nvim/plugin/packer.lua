local plugins = {
    'wbthomason/packer.nvim',

    -- Easier neovim development
    -- { 'neovim/nvimdev.nvim', requires = { 'neomake/neomake', 'nvim-lua/plenary.nvim' } },

    -- Reference for lua language features
    'bfredl/luarefvim',

    -- git plugins
    'tpope/vim-fugitive',

    -- tmux
    'edkolev/tmuxline.vim',
    'christoomey/vim-tmux-navigator',

    -- Firenvim
    {
        'glacambre/firenvim',
        run = function()
            vim.fn['firenvim#install'](0)
        end,
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
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

    -- Themes
    {
        'dracula/vim',
        as = 'dracula',
    },
    { 'sonph/onehalf', rtp = 'vim' },
    { 'kyoz/purify', rtp = 'vim' },
    'owozsh/amora',
    'tomasr/molokai',
    'sjl/badwolf',
    'TroyFletcher/vim-colors-synthwave',
    'Badacadabra/vim-archery',
    'mhartington/oceanic-next',
    'bluz71/vim-moonfly-colors',
    'folke/tokyonight.nvim',
    'morhetz/gruvbox',
    { 'catppuccin/nvim', as = 'catppuccin' },
}

local config = {
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end,
        keybindings = {
            quit = '<esc>',
        },
    },
    compile_path = vim.fn.stdpath 'cache' .. '/packer_compiled.lua',
    git = {
        subcommands = {
            update = 'pull --ff-only --progress --rebase',
        },
    },
    autoremove = true,
}

require('packer').startup { plugins, config = config }
