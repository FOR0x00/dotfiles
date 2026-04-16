vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.showmode = false -- Dont show mode since we have a statusline
opt.cursorline = true -- Enable highlighting of the current line
opt.mouse = "a" -- Enable mouse mode
opt.laststatus = 3 -- global statusline
-- Search
opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Don't ignore case with capitals
-- Indent & tab
opt.autoindent = true -- Copy indent from current line when starting new one
opt.smartindent = true -- Insert iutomatically
opt.wrap = false -- Disable line wrap
opt.tabstop = 2 -- Number of spaces tabs count for
opt.shiftwidth = 2 -- Size of an indent
opt.expandtab = true -- Use spaces instead of tabs

opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current

opt.clipboard = "unnamedplus" -- Sync with system clipboard
