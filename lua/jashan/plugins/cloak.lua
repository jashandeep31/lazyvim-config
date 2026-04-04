return {
  'laytan/cloak.nvim',
  event = { 'BufReadPre .env*', 'BufNewFile .env*' },
  config = function()
    require('cloak').setup {
      enabled = true,
      cloak_character = '*',
      patterns = {
        {
          file_pattern = '.env*',
          cloak_pattern = '=.+',
        },
      },
    }

    -- Keymaps
    vim.keymap.set('n', '<leader>ce', '<cmd>CloakEnable<cr>', { desc = 'Cloak Enable' })
    vim.keymap.set('n', '<leader>cd', '<cmd>CloakDisable<cr>', { desc = 'Cloak Disable' })
    vim.keymap.set('n', '<leader>ct', '<cmd>CloakToggle<cr>', { desc = 'Cloak Toggle' })
    vim.keymap.set('n', '<leader>cp', '<cmd>CloakPreviewLine<cr>', { desc = 'Cloak Preview Line' })

    -- Auto-enable cloak when leaving or entering a .env file
    local cloak_group = vim.api.nvim_create_augroup('CloakAutoEnable', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufLeave', 'WinLeave', 'BufEnter' }, {
      group = cloak_group,
      pattern = '.env*',
      callback = function()
        pcall(vim.cmd, 'CloakEnable')
      end,
    })
  end,
}
