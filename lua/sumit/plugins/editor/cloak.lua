return {
	"laytan/cloak.nvim",
	event = "BufReadPre",
	opts = {
		enabled = true,
		cloak_character = "*",
		patterns = {
			{ file_pattern = ".env*", cloak_pattern = "=.+" },
		},
	},
	keys = {
		{ "<leader>x", "<cmd>CloakToggle<cr>", desc = "Toggle Cloak" },
	},
}
