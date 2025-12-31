return {
	"andweeb/presence.nvim",
	event = "VeryLazy",
	config = function()
		require("presence").setup({
			auto_update = true,
			neovim_image_text = "The One True Text Editor",
			main_image = "neovim",
		})
	end,
}
