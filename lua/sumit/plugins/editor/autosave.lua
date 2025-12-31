return {
	"okuuva/auto-save.nvim",
	event = { "InsertEnter", "TextChanged" },
	opts = {
		enabled = true,
		trigger_events = { "InsertLeave", "TextChanged" },
		debounce_delay = 1000,
	},
}
