return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    picker = {},
    bufdelete = {},
    lazygit = {},
    terminal = {},
    scratch = {},
  },
  keys = {
    {
      "<leader>gs",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Git Status (Snacks)",
    },
    {
      "<leader>lg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>tx",
      function()
        Snacks.bufdelete()
      end,
      desc = "Close buffer (Snacks)",
    },
    {
      "<leader>tt",
      function()
        Snacks.terminal(nil, { win = { border = "rounded", position = "float" } })
      end,
      desc = "Toggle Floating Terminal",
    },
    {
      [[<c-\>]],
      function()
        Snacks.terminal(nil, { win = { border = "rounded", position = "float" } })
      end,
      mode = { "n", "t" },
      desc = "Toggle Floating Terminal",
    },
    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
  },
}
