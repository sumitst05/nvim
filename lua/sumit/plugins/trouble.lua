local M = {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	opts = {
		vim.keymap.set("n", "<leader>xx", function()
			vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics win = { type = split, position = right }<cr>")
		end),
	},
}

return M
