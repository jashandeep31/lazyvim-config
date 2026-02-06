return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  {
    "christoomey/vim-tmux-navigator", -- tmux & split window navigation
    lazy = false,
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
    keys = {
      { "<C-h>", "<C-w>h", desc = "Window Left" },
      { "<C-l>", "<C-w>l", desc = "Window Right" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Window Down" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Window Up" },
    },
  },
}
