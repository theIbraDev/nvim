vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.inccommand = "split"

vim.opt.nu = true
vim.opt.relativenumber = true

-- Indent / show blankspace
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0 -- Defaults to 8, when 0, it's the same as tabstop
vim.opt.softtabstop = 8
vim.opt.expandtab = false
vim.opt.smartindent = true
vim.opt.list = true
vim.opt.listchars = "tab:| "

-- Folds
vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.formatoptions:remove("o") -- Suprising how often this annoys me.

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80,120"
vim.opt.wrap = false


vim.cmd([[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
]])
