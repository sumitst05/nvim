return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({
			settings = {
				save_on_toggle = true,
			},
		})

		vim.keymap.set("n", "<M-a>", function() harpoon:list():append() end)
		vim.keymap.set("n", "<M-d>", function() harpoon:list():remove() end)
		vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
			{ desc = "Harpoon Menu" })

		-- Navigation
		vim.keymap.set("n", "<M-j>", function() harpoon:list():prev() end)
		vim.keymap.set("n", "<M-k>", function() harpoon:list():next() end)
	end,
}
