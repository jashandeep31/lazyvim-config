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
keymap.set('i', 'jj', '<ESC>', { desc = 'Exit insert mode with jk' })

-- qq: force-quit current window
keymap.set('n', 'qq', ':q!<CR>', { noremap = true, silent = true, desc = 'Force quit window' })

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

-- Move lines up and down
keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Buffer navigation with Shift + h/l
vim.keymap.set('n', 'H', ':bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', 'L', ':bnext<CR>', { desc = 'Next buffer' })

local function refresh_editor_state()
  local bufnr = vim.api.nvim_get_current_buf()

  if vim.bo[bufnr].buftype == '' then
    vim.cmd 'silent! checktime'
    if vim.bo[bufnr].modified then
      vim.notify('Skipped :edit! because buffer has unsaved changes.', vim.log.levels.WARN)
    else
      vim.cmd 'silent! edit!'
    end
  end

  local ok = pcall(vim.cmd, 'silent! LspRestart')
  if not ok then
    local client_ids = {}
    for _, client in ipairs(vim.lsp.get_clients { bufnr = bufnr }) do
      client_ids[#client_ids + 1] = client.id
    end
    if #client_ids > 0 then vim.lsp.stop_client(client_ids, true) end
    vim.defer_fn(function() pcall(vim.cmd, 'silent! LspStart') end, 150)
  end

  vim.defer_fn(function() vim.cmd 'silent! checktime' end, 200)
end

vim.api.nvim_create_user_command('RefreshEditor', refresh_editor_state, {
  desc = 'Reload file from disk and restart LSP for current buffer',
})

keymap.set('n', '<leader>rr', refresh_editor_state, { desc = 'Reload file + restart LSP' })
