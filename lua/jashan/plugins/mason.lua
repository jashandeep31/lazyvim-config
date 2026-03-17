return {
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      {
        'williamboman/mason.nvim',
        opts = {
          ui = {
            icons = {
              package_installed = '✓',
              package_pending = '➜',
              package_uninstalled = '✗',
            },
          },
        },
      },
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
    },
    opts = {
      ensure_installed = {
        -- Web
        'ts_ls',
        'html',
        'cssls',
        'tailwindcss',
        'emmet_ls',

        -- Lua
        'lua_ls',

        -- Backend / Others
        'prismals',
        'pyright',
        'eslint',
        'gopls',

        -- C/C++
        'clangd',
      },
    },
    config = function(_, opts)
      local mason_lspconfig = require('mason-lspconfig')
      local lspconfig = require('lspconfig')
      local cmp_nvim_lsp = require('cmp_nvim_lsp')

      local capabilities = cmp_nvim_lsp.default_capabilities()

      mason_lspconfig.setup(vim.tbl_deep_extend('force', opts, {
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          end,
        },
      }))
    end,
  },

  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
      'williamboman/mason.nvim',
    },
    opts = {
      ensure_installed = {
        -- Formatters
        'prettier',
        'stylua',
        'isort',
        'black',

        -- Linters
        'pylint',
        'eslint_d',

        -- Go tools
        'gofumpt',
        'goimports',

        -- C/C++
        'clang-format',
        'codelldb',
      },
    },
  },
}
