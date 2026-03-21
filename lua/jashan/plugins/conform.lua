return {
  'stevearc/conform.nvim',
  opts = function(_, opts)
    opts.notify_on_error = true
    opts.formatters_by_ft = opts.formatters_by_ft or {}

    opts.formatters_by_ft.typescript = { 'prettierd' }
    opts.formatters_by_ft.typescriptreact = { 'prettierd' }
    opts.formatters_by_ft.javascript = { 'prettierd' }
    opts.formatters_by_ft.javascriptreact = { 'prettierd' }
    opts.formatters_by_ft.json = { 'prettierd' }
    opts.formatters_by_ft.jsonc = { 'prettierd' }
    opts.formatters_by_ft.json5 = { 'prettierd' }
    opts.formatters_by_ft.css = { 'prettierd' }
    opts.formatters_by_ft.html = { 'prettierd' }
    opts.formatters_by_ft.go = { 'goimports', 'gofumpt' }
    opts.formatters_by_ft.c = { 'clang_format' }

    -- 🔥 THIS is the key fix
    opts.format_on_save = function(bufnr)
      return {
        lsp_format = 'fallback',
      }
    end
    return opts
  end,
}
