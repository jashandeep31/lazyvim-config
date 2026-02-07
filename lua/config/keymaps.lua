-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap -- for conciseness

-- Key map to esc
keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

-- oo: insert line below, stay in normal mode
keymap.set("n", "oo", "o<Esc>", { noremap = true, silent = true })
-- OO: insert line above, stay in normal mode
keymap.set("n", "OO", "O<Esc>j", { noremap = true, silent = true })

-- to copy the relative path
keymap.set("n", "<leader>yp", function()
  vim.fn.setreg("+", vim.fn.expand("%:."))
  vim.notify("Copied relative path 📁")
end, { desc = "Copy relative file path" })
