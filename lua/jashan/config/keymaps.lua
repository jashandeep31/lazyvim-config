-- set leader key to space
vim.g.mapleader = ' '

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- File-wide single-character find (highlights all matches in current buffer)
local function find_char_in_file(backward)
  local ok, char = pcall(vim.fn.getcharstr)
  if not ok or not char or char == '' or char == '\027' then return end

  local pattern = '\\V' .. vim.fn.escape(char, '\\')
  vim.fn.setreg('/', pattern)
  vim.o.hlsearch = true

  local flags = backward and 'b' or ''
  local found = vim.fn.search(pattern, flags)
  if found == 0 then vim.notify(("No '%s' found in this file"):format(char), vim.log.levels.INFO) end
end

keymap.set('n', 'f', function() find_char_in_file(false) end, { desc = 'Find char in file (forward)', silent = true })

keymap.set('n', 'F', function() find_char_in_file(true) end, { desc = 'Find char in file (backward)', silent = true })

-- use jk to exit insert mode
keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode with jk' })
keymap.set('i', 'jj', '<ESC>', { desc = 'Exit insert mode with jk' })

-- clear search highlights
keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })

-- oo: insert line below, stay in normal mode
keymap.set('n', 'oo', 'o<Esc>', { noremap = true, silent = true })
-- OO: insert line above, stay in normal mode
keymap.set('n', 'OO', 'O<Esc>j', { noremap = true, silent = true })

-- Diagnostics (errors, warnings, hints)
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic' })
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Prev diagnostic' })

-- Errors only
keymap.set('n', ']e', function() vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR } end, { desc = 'Next error' })

keymap.set('n', '[e', function() vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR } end, { desc = 'Prev error' })

-- Warnings only (bonus)
keymap.set('n', ']w', function() vim.diagnostic.goto_next { severity = vim.diagnostic.severity.WARN } end, { desc = 'Next warning' })

keymap.set('n', '[w', function() vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.WARN } end, { desc = 'Prev warning' })

-- to get the signature_help
keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature help' })
