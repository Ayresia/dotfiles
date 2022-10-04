local opts = { noremap = true, silent = true }
local telescope_builtin = require("telescope.builtin")

vim.keymap.set("n", "<Leader>ff", telescope_builtin.find_files, opts)
vim.keymap.set("n", "<Leader>gf", telescope_builtin.git_files, opts)
vim.keymap.set("n", "<Leader>gs", telescope_builtin.grep_string, opts)
