return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    local telescope = require 'telescope'
    local builtin = require 'telescope.builtin'
    local actions = require 'telescope.actions'

    telescope.setup {
      defaults = {
        file_ignore_patterns = {
          'node_modules',
          '.git/',
        },
        mappings = {
          i = {
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = 'smart_case',
        },
      },
    }

    telescope.load_extension 'fzf'

    local keymap = vim.keymap

    -- 🔎 Find files
    keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
    keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Find Files (Alt)' })

    -- 🔥 Live grep project
    keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Live Grep' })

    -- 👀 Grep word under cursor
    keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Search Word Under Cursor' })

    -- 📄 Current buffer fuzzy search
    keymap.set(
      'n',
      '<leader>fb',
      function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end,
      { desc = 'Search in Current Buffer' }
    )

    -- 📂 Buffers list
    keymap.set('n', '<leader>bb', builtin.buffers, { desc = 'Find Buffers' })

    -- 🌳 Git files
    keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Git Files' })

    -- ❓ Help tags
    keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help Tags' })

    -- ⭐ .env search
    keymap.set(
      'n',
      '<leader>fe',
      function()
        require('telescope.builtin').find_files {
          prompt_title = '.env Files',
          previewer = false,
          find_command = {
            'rg',
            '--files',
            '--hidden',
            '-g',
            '!.git',
            '-g',
            '*.env*',
          },
        }
      end,
      { desc = 'Find .env files' }
    )
  end,
}
