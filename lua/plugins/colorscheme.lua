-- return {
--   {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     opts = {
--       style = "night", -- Or "day", "moon", etc.
--     },
--   },
-- Or for another theme:
-- {
--   "gruvbox-community/gruvbox",
-- },
-- }
return {
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     style = "night", -- Or "day", "moon", etc.
  --   },
  -- },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("gruvbox")
    end,
  },
}
