return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		"ahmedkhalf/project.nvim",
	},
	keys = {
		{ "<leader>tb",  "<cmd>Telescope buffers<cr>",                   desc = "Buffers" },
		{ "<leader>fb", "<cmd>Telescope file_browser<cr>",              desc = "File Browser" },
		{ "<leader>ff", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy Find in Buffer" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>",                 desc = "Live Grep" },
		{ "<leader>pf", "<cmd>Telescope find_files<cr>",                desc = "Find Files" },
		{ "<leader>pl", "<cmd>Telescope projects<cr>",                  desc = "Projects" },
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		require("project_nvim").setup({
			detection_methods = { "pattern" },
			patterns = { ".git", "Makefile", "package.json" },
		})

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				selection_caret = " ",
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
				file_ignore_patterns = {
					".git/", "node_modules/", "target/", "build/", "%.jpg", "%.png", "%.pdf", "%.zip",
				},
			},
			pickers = {
				find_files = { theme = "dropdown" },
				live_grep = { theme = "dropdown" },
				buffers = { theme = "dropdown", previewer = false },
			},
			extensions = {
				file_browser = {
					theme = "dropdown",
					hijack_netrw = true,
				},
			},
		})

		telescope.load_extension("file_browser")
		telescope.load_extension("projects")
	end,
}
