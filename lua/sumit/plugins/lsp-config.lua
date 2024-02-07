return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls",
					"clangd",
					"gopls",
					"html",
					"jdtls",
					"marksman",
					"lua_ls",
					"pyright",
					"rust_analyzer",
					"tsserver",
					"tailwindcss",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			local languages = {
				"bashls",
				"clangd",
				"gopls",
				"html",
				"jdtls",
				"marksman",
				"lua_ls",
				"ocamllsp",
				"pyright",
				"rust_analyzer",
				"tsserver",
				"tailwindcss",
			}

			for _, lang in ipairs(languages) do
				lspconfig[lang].setup({
					capabilities = capabilities,
				})
			end

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true })
			vim.api.nvim_set_keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true })
			vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { noremap = true })
		end,
	},
}
