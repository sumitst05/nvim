return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		vim.diagnostic.config({
			virtual_text = {
				spacing = 4,
				prefix = "-",
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = " ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
			underline = true,
			update_in_insert = false, -- Don't yell at me while I'm still typing!
			severity_sort = true,  -- Prioritize Errors over Warnings
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		require("mason").setup()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		vim.lsp.config('*', {
			capabilities = capabilities,
		})

		local servers = {
			bashls = {},
			gopls = {},
			html = {},
			htmx = {},
			jdtls = {},
			marksman = {},
			pyright = {},
			rust_analyzer = {},
			ts_ls = {},
			templ = {},
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			},
			clangd = {
				cmd = { "clangd", "--offset-encoding=utf-16" },
			},
			tailwindcss = {
				filetypes = { "html", "templ", "astro", "javascript", "javascriptreact", "typescript", "typescriptreact", "react" },
				init_options = { userLanguages = { templ = "html" } },
			},
		}

		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(servers),
		})

		for name, config in pairs(servers) do
			vim.lsp.config(name, config)
			vim.lsp.enable(name)
		end

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
		vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "Go to References" })
		vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
		vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show Diagnostic" })
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
		vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Type Definition" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart Rename" }) -- Rename variable everywhere
	end,
}
