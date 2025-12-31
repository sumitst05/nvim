return {
	"smoka7/hop.nvim",
	version = "*",
	keys = {
		{
			"f",
			function()
				require("hop").hint_char1({
					direction = require("hop.hint").HintDirection.AFTER_CURSOR, current_line_only = true
				})
			end,
			mode = ""
		},
		{
			"F",
			function()
				require("hop").hint_char1({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR, current_line_only = true })
			end,
			mode = ""
		},
		{
			"t",
			function()
				require("hop").hint_char1({ direction = require("hop.hint").HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
			end,
			mode = ""
		},
		{
			"T",
			function()
				require("hop").hint_char1({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
			end,
			mode = ""
		},
		{ "s", "<cmd>HopWord<cr>", mode = { "n", "x", "o" }, desc = "Hop Word" },
		{ "S", "<cmd>HopLine<cr>", mode = { "n", "x", "o" }, desc = "Hop Line" }, },
	config = function()
		require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
	end,
}
