return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            layout_strategy = "horizontal",
            prompt_position = "top"
        },
        keys = {
            { "<leader>ff", function() require("telescope.builtin").find_files() end },
            { "<leader>gf", function() require("telescope.builtin").git_files() end },
            { "<leader>gs", function() require("telescope.builtin").grep_string() end }
        }
    }
}
