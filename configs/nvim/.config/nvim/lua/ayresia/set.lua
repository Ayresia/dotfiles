vim.opt.guicursor = ""
vim.opt.termguicolors = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.errorbells = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.wrap = false

vim.opt.scrolloff = 8
vim.opt.updatetime = 50

vim.g.mapleader = " "

local themeLoaded, _ = pcall(vim.cmd.colorscheme, "moonfly")

if themeLoaded then
    vim.g.moonflyCursorColor = true
    vim.g.moonflyNormalFloat = true
end
