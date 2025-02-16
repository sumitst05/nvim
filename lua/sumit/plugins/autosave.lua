local M = { "okuuva/auto-save.nvim" }

function M.config()
	require("auto-save").setup({
		enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
		trigger_events = { -- See :h events
			immediate_save = { "BufLeave", "FocusLost" }, -- vim events that trigger an immediate save
			defer_save = { "InsertLeave" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
			cancel_deferred_save = { "InsertEnter" }, -- vim events that cancel a pending deferred save
		},
		-- function that takes the buffer handle and determines whether to save the current buffer or not
		-- return true: if buffer is ok to be saved
		-- return false: if it's not ok to be saved
		-- if set to `nil` then no specific condition is applied
		condition = nil,
		write_all_buffers = false, -- write all buffers when the current one meets `condition`
		debounce_delay = 1000, -- delay after which a pending save is executed
		-- log debug messages to 'auto-save.log' file in neovim cache directory, set to `true` to enable
		debug = false,
	})
end

return M
