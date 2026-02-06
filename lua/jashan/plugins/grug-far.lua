return {
  "MagicDuck/grug-far.nvim",
  config = function()
    require("grug-far").setup({})
  end,
  keys = {
    {
      "<leader>sr",
      function()
        require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
      end,
      mode = { "n", "v" },
      desc = "Search and Replace (Current File)",
    },
    {
      "<leader>sR",
      function()
        require("grug-far").open()
      end,
      mode = { "n", "v" },
      desc = "Search and Replace (Global)",
    },
  },
}
