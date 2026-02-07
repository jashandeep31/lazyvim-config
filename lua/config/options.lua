-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_prettier_needs_config = false

-- Always show the tabline (bufferline)
vim.opt.showtabline = 2

-- Do not select completion option by default
vim.opt.completeopt = "menu,menuone,noselect"
