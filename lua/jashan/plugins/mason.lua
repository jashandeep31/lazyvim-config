return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local mason_tool_installer = require("mason-tool-installer")
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- 1. Setup Mason itself
      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      -- 2. Setup LSP Config with Mason
      mason_lspconfig.setup({
        ensure_installed = {
          -- Web
          "ts_ls",
          "html",
          "cssls",
          "tailwindcss",
          "emmet_ls",
          -- Lua
          "lua_ls",
          -- Backend / Others
          "prismals",
          "pyright",
          "eslint",
          "gopls",
          -- C/C++
          "clangd",
        },
        -- Auto-setup all installed servers with cmp capabilities
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = cmp_nvim_lsp.default_capabilities(),
            })
          end,
        },
      })

      -- 3. Setup Tool Installer for formatters, linters, etc.
      mason_tool_installer.setup({
        ensure_installed = {
          -- Formatters
          "prettierd",
          "stylua",
          "isort",
          "black",

          -- Linters
          "pylint",
          "eslint_d",

          -- Go tools
          "gofumpt",
          "goimports",

          -- C/C++
          "clang-format",
          "codelldb",
        },
        auto_update = false,
        run_on_start = true,
      })
    end,
  },
}
