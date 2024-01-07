local M = {
	"akinsho/toggleterm.nvim",
}

function M.config()
	require("toggleterm").setup({
		size = 20,
		hide_numbers = true,
		start_in_insert = true,
		insert_mappings = true,
		open_mapping = [[<c-\>]],
		presist_size = true,
		direction = "float",
		shell = vim.o.shell,
		close_on_exit = true,
		float_opts = {
			border = "curved",
			winblend = 0,
			highlights = {
				border = "Normal",
				background = "Normal",
			},
		},
	})

	function _G.set_terminal_keymaps()
		local opts = { buffer = 0 }
		vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
		vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
		vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
		vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
		vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
		vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
		vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
	end

	vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

	local Terminal = require("toggleterm.terminal").Terminal
	local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

	function _lazygit_toggle()
		lazygit:toggle()
	end

	vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

	vim.keymap.set("n", "<M-1>", "<cmd>ToggleTerm direction=horizontal size=12<cr>", opts)
	vim.keymap.set("t", "<M-1>", "<cmd>ToggleTerm direction=horizontal size=12<cr>", opts)
	vim.keymap.set("n", "<M-2>", "<cmd>ToggleTerm direction=vertical size=50<cr>", opts)
	vim.keymap.set("t", "<M-2>", "<cmd>ToggleTerm direction=vertical size=50<cr>", opts)
	vim.keymap.set("n", "<M-3>", "<cmd>ToggleTerm direction=float<cr>", opts)
	vim.keymap.set("t", "<M-3>", "<cmd>ToggleTerm direction=float<cr>", opts)
end

return M
