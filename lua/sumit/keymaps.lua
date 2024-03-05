vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- unhighlight last search
vim.keymap.set("n", "<leader>H", ":nohlsearch<CR>", { noremap = true, silent = true })

-- change ui windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })

-- center the cursor
vim.keymap.set("n", "j", "jzz", { noremap = true })
vim.keymap.set("n", "k", "kzz", { noremap = true })

-- move visual block up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true })

-- move visual block left and right
vim.keymap.set("v", "<", "<gv", { noremap = true })
vim.keymap.set("v", ">", ">gv", { noremap = true })

-- switch prev and next buffers
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { noremap = true })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprev<cr>", { noremap = true })

-- delete current buffer
vim.keymap.set("n", "<leader>db", "<cmd>bdelete<cr>", { noremap = true })
