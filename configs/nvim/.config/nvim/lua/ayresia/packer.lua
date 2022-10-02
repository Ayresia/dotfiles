return require("packer").startup(function()
    use("wbthomason/packer.nvim")
    use("bluz71/vim-moonfly-colors")
    use("bluz71/vim-mistfly-statusline")
    use("nvim-treesitter/nvim-treesitter", {
        run = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end
    })
end)
