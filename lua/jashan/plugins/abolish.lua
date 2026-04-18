return {
  {
    'tpope/vim-abolish',
    event = 'VeryLazy',
    config = function()
      -- Optional: custom mappings (more discoverable)
      vim.keymap.set('n', '<leader>cs', 'crs', { remap = true, desc = 'snake_case' })
      vim.keymap.set('n', '<leader>cc', 'crc', { remap = true, desc = 'camelCase' })
      vim.keymap.set('n', '<leader>cp', 'crp', { remap = true, desc = 'PascalCase' })
      vim.keymap.set('n', '<leader>ck', 'crk', { remap = true, desc = 'kebab-case' })
      vim.keymap.set('n', '<leader>cu', 'cru', { remap = true, desc = 'UPPER_CASE' })
    end,
  },
}
