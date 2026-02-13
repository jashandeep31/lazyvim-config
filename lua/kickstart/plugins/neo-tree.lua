return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },

  config = function()
    require('neo-tree').setup {
      close_if_last_window = true,
      popup_border_style = 'rounded',
      enable_git_status = true,
      enable_diagnostics = true,

      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true,
        },
        hijack_netrw_behavior = 'open_default',
      },

      window = {
        width = 30,
      },
    }

    local keymap = vim.keymap

    -- 🌳 Open file tree
    keymap.set('n', '<leader>ee', '<cmd>Neotree toggle<cr>', { desc = 'Toggle Explorer' })

    -- 📂 Reveal current file
    keymap.set('n', '<leader>ef', '<cmd>Neotree reveal<cr>', { desc = 'Reveal Current File' })

    -- 📁 Focus explorer
    keymap.set('n', '<leader>e', '<cmd>Neotree focus<cr>', { desc = 'Focus Explorer' })
  end,
}
