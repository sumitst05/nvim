return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.clang_format.with({
					filetypes = { "cpp", "c", "h", "hpp" },
				}),
				null_ls.builtins.formatting.gofumpt,
			},
		})

		vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { noremap = true, desc = "Format Buffer" })
	end,
}
