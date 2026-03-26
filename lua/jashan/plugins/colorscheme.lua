return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      style = 'night', -- storm | night | moon | day
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = false, bold = true },
        functions = { bold = true },
        variables = {},
        sidebars = 'dark',
        floats = 'dark',
      },
    },
    config = function(_, opts)
      require('tokyonight').setup(opts)
      vim.cmd.colorscheme 'tokyonight'
    end,
  },
}

-- return {
--   {
--     'folke/tokyonight.nvim',
--     priority = 1000,
--     opts = {
--       style = 'night',
--       transparent = true,
--       styles = {
--         sidebars = 'transparent',
--         floats = 'transparent',
--       },
--     },
--     config = function(_, opts)
--       require('tokyonight').setup(opts)
--       vim.cmd.colorscheme 'tokyonight'
--
--       -- global transparency
--       vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
--
--       -- telescope transparency fix
--       vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'NoiceCmdlinePopup', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorder', { bg = 'none' })
--
--       -- neo-tree transparency
--       vim.api.nvim_set_hl(0, 'NeoTreeNormal', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'NeoTreeSignColumn', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'NeoTreeFloatBorder', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'NeoTreeFloatTitle', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'NeoTreeEndOfBuffer', { bg = 'none' })
--
--       -- nvim-tree transparency
--       vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'NvimTreeNormalNC', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'NvimTreeEndOfBuffer', { bg = 'none' })
--
--       -- other plugins transparency
--       vim.api.nvim_set_hl(0, 'WhichKeyFloat', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'LazyNormal', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'MasonNormal', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'TroubleNormal', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'NotifyBackground', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'CmpPmenu', { bg = 'none' })
--       vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
--       -- cursor line highlight
--       vim.opt.cursorline = true
--       vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#2a2e36' })
--     end,
--   },
-- }
