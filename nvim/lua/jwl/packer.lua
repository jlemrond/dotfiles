-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP, Linter, Formatter, DAP Manager
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim"
    }

    -- LSP / Completion
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'onsails/lspkind.nvim'
    
    -- Copilot
    use 'github/copilot.vim'

    -- Comments
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Themes
    use 'morhetz/gruvbox'
    use 'hukl/Smyck-Color-Scheme'
    use 'folke/tokyonight.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }
    use { 'embark-theme/vim', as = 'embark' }
    use 'rebelot/kanagawa.nvim'

    -- Context
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'Darazaki/indent-o-matic'

    -- Telescope
    use 'nvim-lua/plenary.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
    }
    
    -- Linters
    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    -- Git
    use 'lewis6991/gitsigns.nvim'
    use 'kdheepak/lazygit.nvim'
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    -- Neo Tree
    -- Unless you are still migrating, remove the deprecated commands from v1.x
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = { 
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }

    -- StatusBar
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- EditorConfig
    use 'gpanders/editorconfig.nvim'

    -- Better Escape
    use {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup({
                mapping = { 'jj', 'kk' },
                clear_empty_lines = true,
            })
        end,
    }

    -- Smooth Scrolling
    use {
        'declancm/cinnamon.nvim',
        config = function() require('cinnamon').setup() end
    }
end)
