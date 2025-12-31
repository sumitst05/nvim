return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter-context",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua", "cpp", "c", "java", "go", "rust", "python",
				"javascript", "typescript", "html", "css", "bash", "markdown", "markdown_inline"
			},
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			autopairs = { enable = true },
			autotags = { enable = true },
		})
	end,
}
