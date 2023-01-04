-- Show line number in a relative fashion
vim.opt.nu = true
vim.opt.relativenumber = true

-- Better spacing/tabbing
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- I trust vim smartness for indentation
vim.opt.smartindent = true

-- No swapfiles plz
vim.opt.swapfile = false
vim.opt.backup = false

-- Don't keep terms higlighted
vim.opt.hlsearch = false
-- Higlight as I go modifying my search
vim.opt.incsearch = true

-- I like the best colors!
vim.opt.termguicolors = true

-- Never 8 than less lines when scrolling
vim.opt.scrolloff = 8
