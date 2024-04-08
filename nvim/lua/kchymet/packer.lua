-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-live-grep-args.nvim' },
        }
    }

    -- icons for nerdfonts
    use('nvim-tree/nvim-web-devicons')
    -- rose-pine theme
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    -- vim.cmd('colorscheme rose-pine')

    -- Darcula (to looks like Jetbrains)
    use({ 'doums/darcula', as = 'darcula' })
    -- vim.cmd('colorscheme darcula')

    -- VSCode (Dark Themes)
    use('martinsione/darkplus.nvim')
    -- vim.cmd('colorscheme darkplus')

    use('nvim-neotest/nvim-nio')
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use('nvim-treesitter/nvim-treesitter-context')

    use('nvim-treesitter/playground')
    use('ThePrimeagen/harpoon')
    use('ThePrimeagen/vim-be-good')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },                  -- Required
            { 'hrsh7th/cmp-nvim-lsp' },              -- Required
            { 'L3MON4D3/LuaSnip' },                  -- Required
        }
    }
    use('christoomey/vim-tmux-navigator')

    use('folke/neodev.nvim')

    use('mfussenegger/nvim-dap')
    use('nvim-telescope/telescope-dap.nvim')
    use('jay-babu/mason-nvim-dap.nvim')
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "ChristianChiarulli/neovim-codicons" } }
    use('leoluz/nvim-dap-go')
    use('theHamsta/nvim-dap-virtual-text')
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use({ "folke/trouble.nvim" })
end)
