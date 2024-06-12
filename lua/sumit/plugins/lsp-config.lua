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
					"htmx",
					"jdtls",
					"marksman",
					"lua_ls",
					"pyright",
					"rust_analyzer",
					"tailwindcss",
					"templ",
					"tsserver",
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
				"htmx",
				"jdtls",
				"marksman",
				"lua_ls",
				"pyright",
				"rust_analyzer",
				"tailwindcss",
				"templ",
				"tsserver",
			}

			local function setupLSP(lang)
				local setup_config = {
					capabilities = capabilities,
				}

				local lsp_setup = {
					clangd = {
						cmd = { "clangd", "--offset-encoding=utf-16" },
					},
					tailwindcss = {
						filetypes = { "html", "templ", "astro", "javascript", "javascriptreact", "typescript", "typescriptreact", "react" },
						init_options = { userLanguages = { templ = "html" } },
					},
					html = {
						filetypes = { "html", "templ" },
					},
					htmx = {
						filetypes = { "html", "templ" },
					},
				}

				local specific_setup = lsp_setup[lang]
				if specific_setup then
					for k, v in pairs(specific_setup) do
						setup_config[k] = v
					end
				end

				lspconfig[lang].setup(setup_config)
			end

			for _, lang in ipairs(languages) do
				setupLSP(lang)
			end

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true })
			vim.api.nvim_set_keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", { noremap = true })
			vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { noremap = true })

			vim.filetype.add({ extension = { templ = "templ" } })
		end,
	},
}
