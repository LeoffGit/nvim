return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
	local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = { "c","php", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html","typescript","css" },
			sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
	  })
end
}
