local M = {
	"windwp/nvim-autopairs",
	dependencies = {
		{ "hrsh7th/nvim-cmp" },
		{ "windwp/nvim-ts-autotag" },
	},
}

function M.config()
	require("nvim-ts-autotag").setup({
		filetypes = { "html", "xml", "javascriptreact", "typescriptreact", "javascript", "typescript", "templ" },
	})

	require("nvim-autopairs").setup({
		check_ts = true,
		ts_config = {
			lua = { "string", "source" },
			javascript = { "string", "template_string" },
			java = false,
		},
		disable_filetype = { "TelescopePrompt", "spectre_panel" },
		fast_wrap = {
			map = "<M-e>",
			chars = { "{", "[", "(", '"', "'" },
			pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
			offset = 0,
		},
	})

	local cmp = require("cmp")
	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
end

return M
