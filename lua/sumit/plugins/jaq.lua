local M = {
	"is0n/jaq-nvim",
}

function M.config()
	require("jaq-nvim").setup({
		cmds = {
			default = "term",

			-- Uses vim commands
			internal = {
				vim = "source %",
			},

			external = {
				c = "gcc % -o $fileBase.out && ./$fileBase.out",
				cpp = "g++ % -o $fileBase.out -std=c++23 && ./$fileBase.out && rm $fileBase.out",
				java = "java %",
				typescript = "deno run %",
				javascript = "node %",
				rust = "rustc % -o $fileBase.out && ./$fileBase.out",
				go = "go run %",
				markdown = "glow %",
				python = "python %",
				sh = "chmod +x % && sh %",
				zsh = "zsh %",
				lua = "lua %",
			},
		},

		behavior = {
			-- Default type
			default = "terminal",

			-- Start in insert mode
			startinsert = false,

			-- Use `wincmd p` on startup
			wincmd = false,

			-- Auto-save files
			autosave = false,
		},

		ui = {
			float = {
				border = "none",

				float_hl = "Normal",
				border_hl = "FloatBorder",

				blend = 0,

				-- Num from `0-1` for measurements
				height = 0.8,
				width = 0.8,
				x = 0.5,
				y = 0.5,
			},

			terminal = {
				-- Window position
				position = "bot",

				-- Window size
				size = 10,

				-- Disable line numbers
				line_no = false,
			},
		},
	})

	vim.keymap.set("n", "<leader>j", "<cmd>Jaq<cr>", { noremap = true, silent = true })
end

return M
