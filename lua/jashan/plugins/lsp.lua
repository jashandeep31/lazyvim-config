return {
  'hrsh7th/cmp-nvim-lsp',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/nvim-cmp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
    { 'folke/lazydev.nvim', opts = {} },
  },
  config = function()
    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require 'cmp_nvim_lsp'

    -- used to enable autocompletion (assign to every lsp server config)
    cmp_nvim_lsp.default_capabilities()

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('jashan-lsp-keymaps', { clear = true }),
      callback = function(event)
        -- Jump to definition of the symbol under the cursor.
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = event.buf, desc = 'LSP: Go to Definition' })
      end,
    })

    -- vim.lsp.config is likely invalid here. Use lspconfig or mason-lspconfig handlers instead.
    -- vim.lsp.config('*', {
    --   capabilities = cmp_nvim_lsp.default_capabilities(),
    -- })
  end,
}
