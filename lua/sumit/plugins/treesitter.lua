local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
}

function M.config()
	local configs = require("nvim-treesitter.configs")
	configs.setup({
		ensure_installed = {
			"lua",
			"cpp",
			"c",
			"java",
			"go",
			"rust",
			"python",
			"javascript",
			"typescript",
			"html",
			"css",
		},
		sync_install = false,
		autopairs = {
			enable = true,
		},
		autotags = {
			enable = true,
		},
		highlight = { enable = true },
		indent = { enable = true },
		-- auto_install = true,
	})
end

return M
