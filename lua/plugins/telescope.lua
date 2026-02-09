return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
  keys = {
    -- {
    --   "<leader>fe",
    --   function()
    --     require("telescope.builtin").find_files({
    --       prompt_title = ".env Files",
    --       find_command = { "rg", "--files", "--hidden", "-g", "!.git", "-g", "*.env*" },
    --     })
    --   end,
    --   desc = "Find .env Files",
    -- },
  },
}
