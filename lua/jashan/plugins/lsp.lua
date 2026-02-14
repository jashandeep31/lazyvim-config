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

    local function smart_jump_new_tab(method)
      return function()
        local client = vim.lsp.get_clients({ bufnr = 0 })[1]
        local params = vim.lsp.util.make_position_params(0, client and client.offset_encoding or 'utf-8')
        vim.lsp.buf_request(0, method, params, function(err, result, ctx, config)
          if err then
            vim.notify('LSP error: ' .. (err.message or tostring(err)), vim.log.levels.ERROR)
            return
          end
          if not result or vim.tbl_isempty(result) then return end

          local client = vim.lsp.get_client_by_id(ctx.client_id)
          local offset_encoding = client and client.offset_encoding or 'utf-8'

          local location = result
          if vim.islist(result) then
            if #result > 1 then
              local handler = vim.lsp.handlers[method]
              if handler then handler(err, result, ctx, config) end
              return
            end
            location = result[1]
          end

          local uri = location.uri or location.targetUri
          if not uri then return end

          local fname = vim.uri_to_fname(uri)
          local escaped_fname = vim.fn.fnameescape(fname)

          local cur_buf = vim.api.nvim_get_current_buf()
          local is_modified = vim.bo[cur_buf].modified
          local cur_name = vim.api.nvim_buf_get_name(cur_buf)
          local filetype = vim.bo[cur_buf].filetype

          local is_empty = cur_name == '' and not is_modified
          local is_starter = filetype == 'alpha' or filetype == 'dashboard' or filetype == 'starter'
          local has_multiple_windows = vim.fn.winnr '$' > 1

          if is_empty or is_starter or has_multiple_windows then
            vim.cmd('edit ' .. escaped_fname)
          else
            vim.cmd('tab drop ' .. escaped_fname)
          end

          vim.lsp.util.show_document(location, offset_encoding)
        end)
      end
    end

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('jashan-lsp-keymaps', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, silent = true, desc = desc })
        end

        map('gd', smart_jump_new_tab 'textDocument/definition', 'LSP: Smart Go to Definition')
        map('gD', smart_jump_new_tab 'textDocument/declaration', 'LSP: Smart Go to Declaration')
        map('gi', smart_jump_new_tab 'textDocument/implementation', 'LSP: Smart Go to Implementation')
        map('gr', vim.lsp.buf.references, 'LSP: Go to References')
        map('K', vim.lsp.buf.hover, 'LSP: Hover')
        map('<leader>cr', vim.lsp.buf.rename, 'LSP: Rename')
        map('<leader>ca', vim.lsp.buf.code_action, 'LSP: Code Action', { 'n', 'v' })
      end,
    })

    -- vim.lsp.config is likely invalid here. Use lspconfig or mason-lspconfig handlers instead.
    -- vim.lsp.config('*', {
    --   capabilities = cmp_nvim_lsp.default_capabilities(),
    -- })
  end,
}
