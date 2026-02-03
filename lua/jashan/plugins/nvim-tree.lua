return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local function on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      local function tab_drop()
        local node = api.tree.get_node_under_cursor()
        if node then
          if node.type == "file" then
            local fname = vim.fn.fnameescape(node.absolute_path)
            
            -- Check if file is already open in any window
            local bufnr = vim.fn.bufnr(node.absolute_path)
            local is_already_open = false
            if bufnr ~= -1 then
              local wins = vim.fn.win_findbuf(bufnr)
              if #wins > 0 then
                is_already_open = true
              end
            end

            if is_already_open then
              vim.cmd("tab drop " .. fname)
            else
              -- Check if current buffer is expendable
              local cur_buf = vim.api.nvim_get_current_buf()
              local is_modified = vim.api.nvim_buf_get_option(cur_buf, "modified")
              local cur_name = vim.api.nvim_buf_get_name(cur_buf)
              local filetype = vim.api.nvim_buf_get_option(cur_buf, "filetype")

              local is_empty = (cur_name == "" and not is_modified)
              local is_alpha = (filetype == "alpha" or filetype == "dashboard" or filetype == "starter")

              if is_empty or is_alpha then
                vim.cmd("edit " .. fname)
              else
                vim.cmd("tab drop " .. fname)
              end
            end
          else
            api.node.open.edit()
          end
        end
      end

      vim.keymap.set("n", "<CR>", tab_drop, opts("Open: Tab Drop"))
    end

    nvimtree.setup({
      on_attach = on_attach,
      view = {
        width = 50,
        relativenumber = true,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
        group_empty = true,
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
      -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      -- configuration for the live filtering feature
      live_filter = {
        always_show_folders = false,
      },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
  end,
}
