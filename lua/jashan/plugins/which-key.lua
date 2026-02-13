return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    -- delay between pressing a key and opening which-key (milliseconds)
    delay = 500,
    icons = { mappings = vim.g.have_nerd_font },
    win = {
      width = { min = 24, max = 38 },
      height = { min = 4, max = 0.45 },
      col = -1,
      row = -1,
      border = 'rounded',
      title = true,
      title_pos = 'left',
      padding = { 0, 1 },
    },
    layout = {
      width = { min = 24, max = 32 },
      spacing = 1,
    },

    -- Document existing key chains
    spec = {
      { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    },
  },
}
