require("jashan.core.options")
require("jashan.core.keymaps")
require("jashan.core.lsp-keymaps")

vim.diagnostic.config({
	virtual_text = {
		spacing = 2,
		prefix = "●", -- could be "■", "▎", "x"
	},
	float = {
		focusable = true,
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
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
			focusable = true,
			border = "rounded",
			source = "always",
			prefix = "",
		})
	end,
})

-- Configure hover to be focusable
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	focusable = true,
	border = "rounded",
})
