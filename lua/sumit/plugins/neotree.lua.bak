local M = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	event = { "BufRead", "VimEnter" },
	enabled = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
}

function M.config()
	require("neo-tree").setup({
		popup_border_style = "rounded",
		window = {
			position = "left",
			width = 27,
			mapping_options = {
				noremap = true,
				nowait = true,
			},
		},
		filesystem = {
			visible = true,
			hide_dotfiles = false,
		},
		hijack_netrw_behavior = "open_current",
		source_selector = {
			winbar = true,
			content_layout = "center",
			sources = {
				{ source = "filesystem", display_name = " 󰈔 File" },
				{ source = "buffers", display_name = "  Bufs" },
				{ source = "git_status", display_name = "  Git" },
			},
		},
	})
	vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { noremap = true, silent = true })
end

return M
