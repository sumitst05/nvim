local M = {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}

function M.config()
	local harpoon = require("harpoon")

	harpoon:setup({
		global_settings = {
			save_on_toggle = true,
			save_on_change = true,
		},
	})

	vim.keymap.set("n", "<M-a>", function()
		harpoon:list():append()
	end)
	vim.keymap.set("n", "<M-d>", function()
		harpoon:list():remove()
	end)
	vim.keymap.set("n", "<leader>h", function()
		harpoon.ui:toggle_quick_menu(harpoon:list())
	end, { desc = "Open harpoon window", noremap = true })

	vim.keymap.set("n", "<M-j>", function()
		harpoon:list():prev()
	end)
	vim.keymap.set("n", "<M-k>", function()
		harpoon:list():next()
	end)
end

return M
