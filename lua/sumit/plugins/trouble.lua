local M = {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	opts = {
		position = "right",
		width = 50,
		icons = true,
		mode = "document_diagnostics",
		action_keys = {
			close = "q",
			cancel = "<esc>",
			refresh = "r",
			toggle_mode = "m", -- toggle between document and workspace mode
			previous = "k",
			next = "j",
		},

		vim.keymap.set("n", "<leader>xx", function()
			require("trouble").toggle()
		end),
		vim.keymap.set("n", "<leader>xr", function()
			require("trouble").toggle("lsp_references")
		end),
	},
}

return M
