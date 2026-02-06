return {
  -- Disable mini.comment in favor of Comment.nvim
  { "nvim-mini/mini.comment", enabled = false },

  -- Add Comment.nvim which supports 'gb' for block comments by default
  {
    "numToStr/Comment.nvim",
    opts = {},
  },
}
