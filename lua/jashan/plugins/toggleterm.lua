return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = 'float',
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'curved',
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        }
      }
    })
    
    -- Custom keymaps for ToggleTerm
    local keymap = vim.keymap
    
    keymap.set('n', '<leader>tt', '<cmd>ToggleTerm direction=float<CR>', { desc = 'Toggle Floating Terminal' })
    keymap.set('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<CR>', { desc = 'Toggle Horizontal Terminal' })
    keymap.set('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical size=40<CR>', { desc = 'Toggle Vertical Terminal' })
  end
}
