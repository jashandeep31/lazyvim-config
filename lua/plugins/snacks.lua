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
    { "<leader>e", false },
    {
      "<leader>ee",
      function()
        Snacks.picker.explorer()
      end,
      desc = "Explorer",
    },
  },
  opts = {
    explorer = {
      replace_netrw = true,
    },
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
          layout = {
            layout = {
              position = "right",
            },
          },
        },
        grep = {
          hidden = true,
          ignored = false,
        },
      },
    },
  },
}
