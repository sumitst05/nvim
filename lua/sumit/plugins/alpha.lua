local M = {
	"goolord/alpha-nvim",
}

function M.config()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")

	local nvim_web_devicons = {
		enabled = true,
		highlight = true,
	}

	-- Header
	local header = {
		type = "text",
		val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		},
		opts = {
			position = "center",
			hl = "function",
		},
	}

	-- Menu
	local buttons = {
		type = "group",
		val = {
			{ type = "text", val = "Shortcuts", opts = { hl = "SpecialComment", position = "center" } },
			{ type = "padding", val = 1 },
			dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "  Find file", ":cd $HOME | Telescope find_files<CR>"),
			dashboard.button(
				"p",
				"  Projects",
				"<cmd>lua require('telescope').extensions.projects.projects(require('telescope.themes').get_dropdown{previewer = false, initial_mode = normal})<cr>"
			),
			dashboard.button("c", "  Config", "<cmd>e $MYVIMRC<CR>"),
			dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
			dashboard.button("m", "  Mason", ":Mason<CR>"),
			dashboard.button("q", "  Quit", ":qa<CR>"),
		},
		position = "center",
	}

	-- Fortune
	local fortune = {
		type = "text",
		val = require("sumit.fortune"),
		opts = {
			position = "center",
			hl = "function",
		},
	}

	-- Recents
	local cdir = vim.fn.getcwd()
	local if_nil = vim.F.if_nil
	local plenary_path = require("plenary.path")
	local default_mru_ignore = { "gitcommit" }

	local mru_opts = {
		ignore = function(path, ext)
			return (string.find(path, "COMMIT_EDITMSG")) or (vim.tbl_contains(default_mru_ignore, ext))
		end,
	}

	local function get_extension(fn)
		local match = fn:match("^.+(%..+)$")
		local ext = ""
		if match ~= nil then
			ext = match:sub(2)
		end
		return ext
	end

	local function icon(fn)
		local nwd = require("nvim-web-devicons")
		local ext = get_extension(fn)
		return nwd.get_icon(fn, ext, { default = true })
	end

	local function file_button(fn, sc, short_fn)
		short_fn = short_fn or fn
		local ico_txt
		local fb_hl = {}

		if nvim_web_devicons.enabled then
			local ico, hl = icon(fn)
			local hl_option_type = type(nvim_web_devicons.highlight)
			if hl_option_type == "boolean" then
				if hl and nvim_web_devicons.highlight then
					table.insert(fb_hl, { hl, 0, 3 })
				end
			end
			if hl_option_type == "string" then
				table.insert(fb_hl, { nvim_web_devicons.highlight, 0, 3 })
			end
			ico_txt = ico .. "  "
		else
			ico_txt = ""
		end
		local file_button_el = dashboard.button(sc, ico_txt .. short_fn, "<cmd>e " .. fn .. " <CR>")
		local fn_start = short_fn:match(".*[/\\]")
		if fn_start ~= nil then
			table.insert(fb_hl, { "Comment", #ico_txt - 2, #fn_start + #ico_txt })
		end
		file_button_el.opts.hl = fb_hl
		return file_button_el
	end

	local function mru(start, cwd, items_number, opts)
		opts = opts or mru_opts
		items_number = if_nil(items_number, 9)

		local oldfiles = {}
		for _, v in pairs(vim.v.oldfiles) do
			if #oldfiles == items_number then
				break
			end
			local cwd_cond
			if not cwd then
				cwd_cond = true
			else
				cwd_cond = vim.startswith(v, cwd)
			end
			local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
			if (vim.fn.filereadable(v) == 1) and cwd_cond and not ignore then
				oldfiles[#oldfiles + 1] = v
			end
		end
		local target_width = 39

		local tbl = {}
		for i, fn in ipairs(oldfiles) do
			local short_fn
			if cwd then
				short_fn = vim.fn.fnamemodify(fn, ":.")
			else
				short_fn = vim.fn.fnamemodify(fn, ":~")
			end

			if #short_fn > target_width then
				short_fn = plenary_path.new(short_fn):shorten(1, { -2, -1 })
				if #short_fn > target_width then
					short_fn = plenary_path.new(short_fn):shorten(1, { -1 })
				end
			end

			local shortcut = tostring(i + start - 1)

			local file_button_el = file_button(fn, shortcut, short_fn)
			tbl[i] = file_button_el
		end
		return {
			type = "group",
			val = tbl,
			opts = {},
		}
	end

	local recents = {
		type = "group",
		val = {
			{
				type = "text",
				val = "Recents",
				opts = {
					hl = "SpecialComment",
					shrink_margin = false,
					position = "center",
				},
			},
			{ type = "padding", val = 1 },
			{
				type = "group",
				val = function()
					return { mru(0, cdir, 9) }
				end,
				opts = { shrink_margin = false },
			},
		},
	}

	-- Config
	local config = {
		layout = {
			{ type = "padding", val = 1 },
			header,
			{ type = "padding", val = 1 },
			recents,
			{ type = "padding", val = 1 },
			buttons,
			{ type = "padding", val = 0 },
			fortune,
		},
	}

	-- Send config to alpha
	alpha.setup(config)

	-- Disable folding on alpha buffer
	vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

	-- Set keymap for alpha
	vim.keymap.set("n", "<leader>a", "<cmd>Alpha<cr>", { noremap = true, silent = true })
end

return M
