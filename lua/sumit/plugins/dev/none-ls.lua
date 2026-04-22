return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.diagnostics.qmllint,
			},
		})

		vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { noremap = true, desc = "Format Buffer" })
	end,
}
