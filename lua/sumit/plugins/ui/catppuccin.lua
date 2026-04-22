return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			background = { light = "latte", dark = "mocha" },
			transparent_background = true,
			custom_highlights = function(colors)
				return {
					IncSearch = { bg = colors.surface2, fg = colors.none },
					YankColor = { bg = colors.surface1, fg = colors.none, bold = true },
				}
			end,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				mini = { enabled = true },
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
