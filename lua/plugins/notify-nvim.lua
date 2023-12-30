return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			top_down = true,
		})
	end,
}
