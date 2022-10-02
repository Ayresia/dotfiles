return require("packer").startup(function()
    use("wbthomason/packer.nvim")
    use("bluz71/vim-moonfly-colors")
    use("bluz71/vim-mistfly-statusline")
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

    use("nvim-treesitter/nvim-treesitter", {
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end
    })
end)
