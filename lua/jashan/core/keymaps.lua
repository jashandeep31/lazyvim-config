-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
-- keymap.set("i", "jj", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabonly<CR>", { desc = "Close all other tabs" }) -- close all other tabs
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- move through tabs
keymap.set("n", "H", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "L", "<cmd>tabn<CR>", { desc = "Go to next tab" })

-- oo: insert line below, stay in normal mode
keymap.set("n", "oo", "o<Esc>k", { noremap = true, silent = true })
-- OO: insert line above, stay in normal mode
keymap.set("n", "OO", "O<Esc>j", { noremap = true, silent = true })

-- Diagnostics (errors, warnings, hints)
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })

-- Errors only
keymap.set("n", "]e", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Next error" })

keymap.set("n", "[e", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Prev error" })

-- Warnings only (bonus)
keymap.set("n", "]w", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
end, { desc = "Next warning" })

keymap.set("n", "[w", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
end, { desc = "Prev warning" })

-- to get the signature_help
keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })

-- move lines up and down
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
