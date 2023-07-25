return function()
	vim.defer_fn(function()
		require("copilot").setup({
			cmp = {
				enabled = true,
				method = "getCompletionsCycling",
			},
			panel = {
				-- if true, it can interfere with completions in copilot-cmp
				enabled = true,
			},
			suggestion = {
				-- if true, it can interfere with completions in copilot-cmp
				enabled = true,
			},
			filetypes = {
				["dap-repl"] = false,
				["big_file_disabled_ft"] = false,
			},
		})
	end, 100)
end
