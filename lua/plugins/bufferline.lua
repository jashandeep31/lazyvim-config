return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      always_show_bufferline = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    -- Ensure showtabline is set to 2 (always show)
    vim.opt.showtabline = 2
  end,
}
