return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    picker = {
      ui_select = false,
    },
    bufdelete = {},
    lazygit = {},
    terminal = {},
    scratch = {},
  },
  keys = {
    {
      '<leader>gs',
      function() Snacks.picker.git_status() end,
      desc = 'Git Status (Snacks)',
    },
    {
      '<leader>gc',
      function()
        Snacks.picker.git_log_file {
          confirm = function(picker, item)
            picker:close()
            if not item or not item.commit then
              return
            end
            local file = item.file or vim.api.nvim_buf_get_name(0)
            if file == '' then
              return
            end
            vim.schedule(function()
              vim.cmd('DiffviewOpen ' .. item.commit .. '^! -- ' .. vim.fn.fnameescape(file))
            end)
          end,
        }
      end,
      desc = 'Pick Commit Diff (File)',
    },
    {
      '<leader>lg',
      function() Snacks.lazygit() end,
      desc = 'Lazygit',
    },
    {
      '<leader>tx',
      function() Snacks.bufdelete() end,
      desc = 'Close buffer (Snacks)',
    },
    {
      [[<c-\>]],
      function() Snacks.terminal(nil, { win = { border = 'rounded', position = 'float' } }) end,
      mode = { 'n', 't' },
      desc = 'Toggle Floating Terminal',
    },
    {
      '<leader>.',
      function() Snacks.scratch() end,
      desc = 'Toggle Scratch Buffer',
    },
    {
      '<leader>u',
      function() Snacks.picker.undo() end,
      desc = 'Undo History',
    },
  },
}
