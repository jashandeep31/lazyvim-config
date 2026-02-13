return {
  'sindrets/diffview.nvim',
  event = 'BufReadPre',
  cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
  keys = {
    { '<leader>gd', '<cmd>DiffviewFileHistory %<CR>', desc = 'Diff File History' },
    { '<leader>gD', '<cmd>DiffviewOpen<CR>', desc = 'Diff View (Global)' },
    { '<leader>gx', '<cmd>DiffviewClose<CR>', desc = 'Close Diff View' },
  },
}
