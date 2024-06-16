local opt = vim.opt

-- Tree style
vim.cmd("let g:netrw_liststyle = 3")

-- Use system clipboard as default
opt.clipboard:append("unnamedplus")

-- Backspace
opt.backspace = "indent,eol,start"

-- Relative line number
opt.relativenumber = true
opt.number = true

--Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true

-- UI
opt.cursorline = true
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Split
opt.splitright = true
opt.splitbelow = true
