return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        cmd = { "TSUpdateSync" },
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            auto_install = true,
            highlight = {
                enable = true,
                addition_vim_regex_highlighting = false
            },
            indent = {
                enable = true
            }
        }
    }
}
