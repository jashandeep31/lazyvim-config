return {
  'MagicDuck/grug-far.nvim',
  cmd = { 'GrugFar', 'GrugFarWithin' }, -- lazy load on command
  keys = {
    {
      '<leader>sr',
      '<cmd>GrugFar<CR>',
      mode = 'n',
      desc = 'Search & Replace (grug-far)',
    },
    {
      '<leader>sr',
      function() require('grug-far').with_visual_selection() end,
      mode = 'x',
      desc = 'Search selection (grug-far)',
    },
    {
      '<leader>sf',
      function()
        require('grug-far').open {
          prefills = {
            paths = vim.fn.expand '%',
          },
        }
      end,
      mode = 'n',
      desc = 'Search in current file',
    },
  },
  config = function()
    local grug = require 'grug-far'

    grug.setup {
      -- UI behavior
      windowCreationCommand = 'vsplit', -- open in vertical split
      startInInsertMode = true,

      -- optional: customize search behavior
      engines = {
        ripgrep = {
          path = 'rg',
          extraArgs = '--hidden --glob !.git',
        },
      },
    }
  end,
}
