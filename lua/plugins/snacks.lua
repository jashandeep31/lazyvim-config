return {
  "folke/snacks.nvim",
  keys = {
    { "<leader><space>", false },
    { "<leader>ff", false },
    { "<leader>fr", false },
    { "<leader>fc", false },
    { "<leader>fd", false },
    { "<leader>fg", false },
    { "<leader>fs", false },
    {
      "<leader>ee",
      function()
        Snacks.picker.explorer()
      end,
      desc = "Explorer",
    },
  },
  opts = {
    picker = {
      sources = {
        -- files = {
        --   hidden = true,
        --   ignored = false,
        --   args = {
        --     "--glob",
        --     "!{node_modules,build,dist,.git}",
        --   },
        -- },
        grep = {
          hidden = true,
          ignored = false,
        },
        explorer = {
          hidden = true,
          ignored = true,
          layout = {
            layout = {
              position = "right",
            },
          },
        },
      },
    },
  },
}
