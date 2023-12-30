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
				ensure_installed = { "lua_ls", "tsserver" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			-- Setup language servers.
			lspconfig.tsserver.setup({})

			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- buffer local mappings.
					-- see `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gd", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
					vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set(
						"n",
						"<space>wa",
						vim.lsp.buf.add_workspace_folder,
						{ desc = "Workspace folder Add" }
					)
					vim.keymap.set(
						"n",
						"<space>wr",
						vim.lsp.buf.remove_workspace_folder,
						{ desc = "Workspace folder Remove" }
					)
					vim.keymap.set("n", "<space>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, { desc = "Workspace folder List" })
					vim.keymap.set("n", "<space>d", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { desc = "ReName" })
					vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
					vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
					vim.keymap.set("n", "<space>ft", function()
						vim.lsp.buf.format({ async = true })
					end, { desc = "Format Document" })
				end,
			})
		end,
	},
}
