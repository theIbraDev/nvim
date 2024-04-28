--This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use('nvim-lua/plenary.nvim')
    use {
        "ThePrimeagen/harpoon", -- delete harpoon.json if this fucks with you.
        branch = "harpoon2",
    }
    use('ThePrimeagen/vim-be-good')
    use('ThePrimeagen/git-worktree.nvim')
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
    }
    use('nvim-telescope/telescope-ui-select.nvim')
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use('nvim-treesitter/playground')
    use('mbbill/undotree')
    use('tpope/vim-surround')
    use('tpope/vim-fugitive')
    use('evanleck/vim-svelte')
    use('pangloss/vim-javascript')
    use('HerringtonDarkholme/yats.vim')
    use{
        'prettier/vim-prettier',
        run = 'pnpm install',
        ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'markdown', 'svelte', 'html'}
}
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            -- {'williamboman/mason.nvim'},
            -- {'williamboman/mason-lspconfig.nvim'},
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
            -- snippets
            {'rafamadriz/friendly-snippets'},
        }
    }
    use('nvim-tree/nvim-web-devicons')
    use {
        'nvim-lualine/lualine.nvim',
    }
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use('lewis6991/gitsigns.nvim')
end)
