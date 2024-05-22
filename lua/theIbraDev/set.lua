-- Search
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Filetree
vim.opt.nu = true
vim.opt.relativenumber = true

-- Buffer
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
-- This is suprising how often this annoys me.
vim.opt.formatoptions:remove("o")

-- Theme
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Performance
vim.opt.updatetime = 50

-- Clean code
vim.opt.colorcolumn = "80"
vim.opt.wrap = false

-- Leader
vim.g.mapleader = " "

-- Yank
vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]])
