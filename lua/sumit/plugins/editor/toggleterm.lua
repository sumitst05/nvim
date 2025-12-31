return {
	"akinsho/toggleterm.nvim",
	cmd = { "ToggleTerm", "TermExec" },
	keys = {
		{ "<leader>lg", "<cmd>lua _lazygit_toggle()<cr>",                   desc = "Lazygit" },
		{ "<M-1>",      "<cmd>ToggleTerm direction=horizontal size=12<cr>", mode = { "n", "t" }, desc = "Terminal Horizontal" },
		{ "<M-2>",      "<cmd>ToggleTerm direction=vertical size=50<cr>",   mode = { "n", "t" }, desc = "Terminal Vertical" },
		{ "<M-3>",      "<cmd>ToggleTerm direction=float<cr>",              mode = { "n", "t" }, desc = "Terminal Float" },
	},
	config = function()
		require("toggleterm").setup({
			size = 20,
			hide_numbers = true,
			open_mapping = [[<c-\>]],
			shade_filetypes = {},
			shade_terminals = true,
			start_in_insert = true,
			insert_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
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
	end,
}
