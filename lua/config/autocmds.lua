-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("FileType", {
  pattern = "sh", -- .env files are detected as sh
  callback = function()
    if vim.fn.expand("%:t") == ".env" then
      vim.opt_local.conceallevel = 2
      vim.opt_local.concealcursor = "n"

      vim.cmd([[
        syntax match EnvValue /=.*/ conceal cchar=*
      ]])

      vim.keymap.set("n", "<leader>eh", function()
        if vim.opt_local.conceallevel:get() == 0 then
          vim.opt_local.conceallevel = 2
        else
          vim.opt_local.conceallevel = 0
        end
      end, { buffer = true, desc = "Toggle .env concealment" })
    end
  end,
})
