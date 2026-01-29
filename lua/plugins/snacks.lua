return {
  "folke/snacks.nvim",
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
        },
      },
    },
  },
}
