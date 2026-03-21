return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {},
  },
  keys = {
    {
      "<leader>gs",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Git Status (Snacks)",
    },
  },
}
