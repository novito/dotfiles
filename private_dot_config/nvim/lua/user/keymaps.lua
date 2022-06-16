-- Don't map using recursion, and don't show message when key sequence is used
local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
-- keymap(mode, origin, destination, options)

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts) -- Make sure Space doesn't have any mapping 
vim.g.mapleader = " " -- Map loader to space " "
vim.g.maplocalleader = " " -- Map local leader to space " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Nvim tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>n", ":NvimTreeFindFile<CR>", opts)

-- Resize with arrows
keymap("n", "<Up>", ":resize -2<CR>", opts)
keymap("n", "<Down>", ":resize +2<CR>", opts)
keymap("n", "<Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Clear highlight
keymap("n", "<C-p>", ":noh <CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press kj fast to exit insert mode
keymap("i", "kj", "<ESC>", opts)

