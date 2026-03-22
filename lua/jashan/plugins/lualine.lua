return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local function error_color()
      local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
      if errors > 0 then
        -- Red background, white foreground to indicate error
        return { bg = '#cc241d', fg = '#ffffff', gui = 'bold' }
      end
      -- Return nil to use default theme colors
      return nil
    end

    require('lualine').setup {
      options = {
        theme = 'auto',
        globalstatus = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff' },
        lualine_c = {
          {
            'filename',
            path = 1, -- show relative path
            color = error_color,
          },
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            color = error_color,
          }
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
    }
  end,
}
