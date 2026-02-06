return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		win = {
			col = 0.99,
			width = 0.2,
			no_overlap = false,
		},
	},
}
