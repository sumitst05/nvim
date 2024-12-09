local M = {
	"nvimtools/none-ls.nvim",
}

function M.config()
	local null_ls = require("null-ls")
	null_ls.setup({
		sources = {
			-- null_ls.builtins.formatting.stylua,
			-- null_ls.builtins.formatting.beautysh,
			null_ls.builtins.formatting.prettier,
			null_ls.builtins.formatting.black,
			null_ls.builtins.formatting.clang_format,
			null_ls.builtins.formatting.gofumpt,

			-- null_ls.builtins.diagnostics.luacheck,
		},
	})

	vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { noremap = true })
end

return M
