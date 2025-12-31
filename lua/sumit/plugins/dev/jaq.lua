return {
	"is0n/jaq-nvim",
	keys = {
		{ "<leader>j", "<cmd>Jaq<cr>", desc = "Run Code (Jaq)" },
	},
	config = function()
		require("jaq-nvim").setup({
			cmds = {
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
				default = "terminal",
				startinsert = false,
				wincmd = false,
				autosave = false,
			},
			ui = {
				float = { border = "none" },
				terminal = { position = "bot", size = 10, line_no = false },
			},
		})
	end,
}
