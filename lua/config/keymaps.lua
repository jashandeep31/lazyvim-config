-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
-- oo: insert line below, stay in normal mode
vim.keymap.set("n", "oo", "o<Esc>k", { noremap = true, silent = true })
-- OO: insert line above, stay in normal mode
vim.keymap.set("n", "OO", "O<Esc>j", { noremap = true, silent = true })
