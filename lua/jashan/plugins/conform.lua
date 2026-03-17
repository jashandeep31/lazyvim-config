return {
  'stevearc/conform.nvim',
  opts = function(_, opts)
    opts.notify_on_error = true
    opts.formatters_by_ft = opts.formatters_by_ft or {}

    opts.formatters_by_ft.typescript = { 'prettier' }
    opts.formatters_by_ft.typescriptreact = { 'prettier' }
    opts.formatters_by_ft.javascript = { 'prettier' }
    opts.formatters_by_ft.javascriptreact = { 'prettier' }
    opts.formatters_by_ft.json = { 'prettier' }
    opts.formatters_by_ft.jsonc = { 'prettier' }
    opts.formatters_by_ft.json5 = { 'prettier' }
    opts.formatters_by_ft.css = { 'prettier' }
    opts.formatters_by_ft.html = { 'prettier' }
    opts.formatters_by_ft.go = { 'goimports', 'gofumpt' }
    opts.formatters_by_ft.c = { 'clang_format' }

    -- 🔥 THIS is the key fix
    opts.format_on_save = function(bufnr)
      return {
        timeout_ms = 500,
        lsp_format = 'fallback',
      }
    end
    return opts
  end,
}
