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
      use_popups_for_input = false, -- Uses the default command line for input (enabling path completion)

      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        follow_current_file = {
          enabled = true,
        },
        hijack_netrw_behavior = 'open_default',
      },

      window = {
        position = 'right',
        width = 30,
        mappings = {
          ['W'] = 'close_all_nodes',
          ['H'] = 'toggle_hidden', -- already toggles dotfiles
        },
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
