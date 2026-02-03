require("jashan.core.options")
require("jashan.core.keymaps")

vim.diagnostic.config({
	virtual_text = {
		spacing = 2,
		prefix = "●", -- could be "■", "▎", "x"
	},
	signs = true, -- icons in sign column
	underline = true, -- underline the problem text
	update_in_insert = false,
	severity_sort = true,
})

vim.o.updatetime = 250

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, {
			focusable = false,
			border = "rounded",
			source = "always",
			prefix = "",
		})
	end,
})
