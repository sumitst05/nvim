return {
	"rcarriga/nvim-notify",
	keys = {
		{
			"<leader>nd",
			function()
				require("notify").dismiss({ silent = true, pending = true })
			end,
			desc = "Dismiss all Notifications",
		},
	},
	opts = {
		background_colour = "#1A1B26",

		stages = "static", -- Animation style (static, fade_in_slide_out, fade, slide, dissolve)
		timeout = 3000,  -- Default timeout for notifications
		max_height = function()
			return math.floor(vim.o.lines * 0.75)
		end,
		max_width = function()
			return math.floor(vim.o.columns * 0.75)
		end,
		on_open = function(win)
			vim.api.nvim_win_set_config(win, { zindex = 100 })
		end,
	},
}
