vim.opt.autoindent = true                       -- auto indent new lines
vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages

vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hidden = true                           -- don't unload buffers when leaving them
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns

vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.number = true                           -- set numbered lines
vim.opt.numberwidth = 4                         -- set number column width to 2 {default 4}
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.scrolloff = 3                            -- min. lines to keep above or below the cursor when scrolling
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- no need to create swap files
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab
vim.opt.termguicolors = true                    -- more colors!
vim.opt.relativenumber = true                   -- set relative numbered lines
vim.opt.visualbell = false                      -- don't make noises
vim.opt.wrap = false                            -- display lines as one long line
