return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    picker = {},
    explorer = {},
  },
  keys = {
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
  },
}
