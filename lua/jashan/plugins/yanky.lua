return {
  'gbprod/yanky.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  opts = {
    -- Enable ring history
    ring = { storage = 'shada' },
  },
  config = function(_, opts)
    require('yanky').setup(opts)
    require('telescope').load_extension 'yank_history'
  end,
  keys = {
    -- The requested keymap to show yank history
    { '<leader>p', '<cmd>Telescope yank_history<cr>', mode = { 'n', 'x' }, desc = 'Open Yank History' },
    -- Essential mappings for yanky to function
    { 'y', '<Plug>(YankyYank)', mode = { 'n', 'x' }, desc = 'Yank text' },
    { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after cursor' },
    { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before cursor' },
    { 'gp', '<Plug>(YankyGPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after selection' },
    { 'gP', '<Plug>(YankyGPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before selection' },
  },
}
