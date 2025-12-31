local opt = vim.opt

-- General
opt.autowrite = true
opt.undofile = true
opt.swapfile = false
opt.writebackup = false
opt.clipboard = "unnamedplus"

-- UI
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.showmode = false
opt.fillchars = { eob = " " }
opt.cmdheight = 1

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = false
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Performance
opt.updatetime = 250
