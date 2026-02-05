return {
  "johmsalas/text-case.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  event = "VeryLazy",
  config = function()
    require("textcase").setup({})
    require("telescope").load_extension("textcase")
  end,
  keys = {
    { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "v" }, desc = "Telescope Text Case" },
  },
}
