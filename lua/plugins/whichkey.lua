return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		config = function()
			local wk = require("which-key")

			wk.register({
				f = {
					name = "file", -- optional group name
					f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
					w = { "<cmd>Telescope grep_string<cr>", "Find Word" }, -- create a binding with label
					b = { "<cmd>Telescope buffers<cr>", "find buffers" }, -- create a binding with label
				},
				{
					g = {
						name = "grep",
						f = { "<cmd>Telescope live_grep<cr>", "Grep Files" },
					},
				},
			}, { prefix = "<leader>" })
		end,
	},
}
