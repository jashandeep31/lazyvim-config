return {
  "MagicDuck/grug-far.nvim",
  config = function()
    require("grug-far").setup({})
  end,
  keys = {
    {
      "<leader>sr",
      function()
        require("grug-far").open()
      end,
      mode = { "n", "v" },
      desc = "Search and Replace (Grug Far)",
    },
  },
}
