local M = {
	"ahmedkhalf/project.nvim",
	event = "VeryLazy",

	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-telescope/telescope.nvim",
			dependencies = {
				{ "nvim-telescope/telescope-file-browser.nvim" },
			},
		},
	},
}

function M.config()
	local telescope = require("telescope")
	telescope.load_extension("file_browser")
	telescope.load_extension("projects")

	require("project_nvim").setup({
		active = true,
		on_config_done = nil,
		manual_mode = false,
		detection_methods = { "pattern" },
		patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "LICENSE" },
		show_hidden = false,
		silent_chdir = true,
		ignore_lsp = {},
		datapath = vim.fn.stdpath("data"),
	})

	telescope.setup({
		defaults = {
			initial_mode = "normal",
			path_display = { "smart" },
			selection_caret = " ",
			file_ignore_patterns = {
				".git/",
				"target/",
				"docs/",
				"vendor/*",
				"%.lock",
				"__pycache__/*",
				"%.sqlite3",
				"%.ipynb",
				"node_modules/*",
				"%.jpg",
				"%.jpeg",
				"%.png",
				"%.svg",
				"%.otf",
				"%.ttf",
				"%.webp",
				".dart_tool/",
				".github/",
				".gradle/",
				".idea/",
				".settings/",
				".vscode/",
				"__pycache__/",
				"build/",
				"env/",
				"gradle/",
				"node_modules/",
				"%.pdb",
				"%.dll",
				"%.class",
				"%.exe",
				"%.cache",
				"%.ico",
				"%.pdf",
				"%.dylib",
				"%.jar",
				"%.docx",
				"%.met",
				"smalljre_*/*",
				".vale/",
				"%.burp",
				"%.mp4",
				"%.mkv",
				"%.rar",
				"%.zip",
				"%.7z",
				"%.tar",
				"%.bz2",
				"%.epub",
				"%.flac",
				"%.tar.gz",
			},
		},

		extensions = {
			file_browser = {
				hijack_netrw = true,
				theme = "dropdown",
				initial_mode = "normal",
				mappings = {
					["i"] = {
						-- your custom insert mode mappings
					},
					["n"] = {
						-- your custom normal mode mappings
					},
				},
			},
		},

		pickers = {
			live_grep = {
				initial_mode = "normal",
				theme = "dropdown",
			},
			grep_string = {
				initial_mode = "normal",
				theme = "dropdown",
			},
			find_files = {
				initial_mode = "normal",
				theme = "dropdown",
			},
			current_buffer_fuzzy_find = {
				initial_mode = "insert",
			},
			buffers = {
				initial_mode = "normal",
				theme = "dropdown",
				previewer = false,
			},
		},
	})

	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<leader>b", builtin.buffers, { noremap = true })
	vim.keymap.set("n", "<leader>fb", "<cmd>Telescope file_browser<cr>", { noremap = true })
	vim.keymap.set("n", "<leader>ff", builtin.current_buffer_fuzzy_find, { noremap = true })
	vim.keymap.set("n", "<leader>fg", builtin.live_grep, { noremap = true })
	vim.keymap.set("n", "<leader>pf", builtin.find_files, { noremap = true })
	vim.keymap.set("n", "<leader>pl", function()
		require("telescope").extensions.projects.projects(
			require("telescope.themes").get_dropdown({ previewer = false })
		)
	end, { noremap = true })
end

return M
