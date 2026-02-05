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
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_file() end, desc = "Git Log (Current File)" },
    { "<leader>u", function() Snacks.picker.undo() end, desc = "Undo History" },
    { "<leader>/", function() Snacks.picker.lines() end, desc = "Search in File" },
    { "/", function() Snacks.picker.lines() end, desc = "Search in File" },
  },
}
