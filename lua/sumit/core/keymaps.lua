-- Unhighlight last search
vim.keymap.set("n", "<leader>H", ":nohlsearch<CR>", { noremap = true, silent = true, desc = "Clear Highlights" })

-- Window Navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, desc = "Go to Left Window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, desc = "Go to Lower Window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, desc = "Go to Upper Window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, desc = "Go to Right Window" })

-- Center cursor when scrolling
vim.keymap.set("n", "j", "jzz", { noremap = true })
vim.keymap.set("n", "k", "kzz", { noremap = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

-- Move visual blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, desc = "Move Line Down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, desc = "Move Line Up" })

-- Indenting in Visual Mode
vim.keymap.set("v", "<", "<gv", { noremap = true })
vim.keymap.set("v", ">", ">gv", { noremap = true })

-- Buffer Navigation
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { noremap = true, desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprev<cr>", { noremap = true, desc = "Prev Buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { noremap = true, desc = "Close Buffer" })

-- Window Splitting
vim.keymap.set("n", "<leader>v", "<C-w>v", { noremap = true, desc = "Split Vertical" })
vim.keymap.set("n", "<leader>s", "<C-w>s", { noremap = true, desc = "Split Horizontal" })

-- Paste over currently selected text without yanking it
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without losing clipboard" })

-- Replace word under cursor
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace Word Under Cursor" })
