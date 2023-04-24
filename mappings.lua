-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },

    
    -- CTRL
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
    ["<C-y>"] = { "<esc>$a;<esc>", desc = "Insert ; at end of line" },
    ["<C-space>"] = {
      require("rust-tools").hover_actions.hover_actions,
      desc = "Rust Hover Actions",
    },

    -- Space i
    ["<leader>if"] = {
      function() vim.lsp.buf.code_action() end,
      desc = "LSP Fixes",
    },
    ["<leader>id"] = {
      function() vim.diagnostic.open_float() end,
      desc = "Float full diagnostics",
    },
    ["<leader>ip"] = {
      function() require("telescope.builtin").diagnostics() end,
      desc = "Search diagnostics",
    },

    -- Space single button
    ["<leader>ct"] = {
      function() require("crates").show_features_popup() end,
      desc = "Show rust crate features",
    },
    ["<leader>ø"] = { "<cmd>Navbuddy<cr>" },
    ["<Leader>y"] = {
      function() require("lsp_lines").toggle() end,
      desc = "Toggle lsp_lines",
    },

    -- Keys
    ["ø"] = {
      function() vim.lsp.buf.hover() end,
      desc = "Hover symbol details",
    },
    ["__"] = { ":w<cr>", desc = "Save File" },

    -- Shift
    ["<S-Up>"] = { "<cmd>m-2<cr>", desc = "Moves line one up" },
    ["<S-Down>"] = { "<cmd>m+<cr>", desc = "Moves line one Down" },
    ["<S-Left>"] = {
      "<cmd>:call vm#commands#add_cursor_up(0, 1)<cr>",
      desc = "Multicursor up"
    },
    ["<S-Right>"] = {
      "<cmd>:call vm#commands#add_cursor_down(0, 1)<cr>",
      desc = "Multicursor down"
    },

    -- Spectre
    ["<leader>,a"] = { '<cmd>lua require("spectre").open()<CR>', desc = "Spectre" },
    ["<leader>,w"] = {
      '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
      desc = "Spectre search current word",
    },
    ["<leader>,p"] = {
      '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
      desc = "Spectre current file",
    },

    -- Tabs / Buffers
    ["tt"] = {
        function()
            require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
        end,
        desc = "Next buffer"
    },
    ["ts"] = {
        function()
            require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
        end,
        desc = "Previous buffer"
    },
    
    -- Debugger
    -- maps.n["<F17>"] = { function() require("dap").terminate() end, desc = "Debugger: Stop" } -- Shift+F5

    -- Harpoon
    ["<leader>h"] = false,
    ["<leader>ha"] = {
      function() require("harpoon.mark").add_file() end,
      desc = "Harpoon add",
    },
    ["<leader>ht"] = {
      function() require("harpoon.ui").toggle_quick_menu() end,
      desc = "Harpoon overview",
    },
    ["<leader>h1"] = {
      function() require("harpoon.ui").nav_file(1) end,
      desc = "Harpoon go to file 1",
    },
    ["<leader>h2"] = {
      function() require("harpoon.ui").nav_file(2) end,
      desc = "Harpoon go to file 2",
    },
    ["<leader>h3"] = {
      function() require("harpoon.ui").nav_file(3) end,
      desc = "Harpoon go to file 3",
    },
    ["<leader>h4"] = {
      function() require("harpoon.ui").nav_file(4) end,
      desc = "Harpoon go to file 4",
    },
  },
  i = {
    ["<C-h>"] = {
      function() require("lsp_lines").toggle() end,
      desc = "Toggle lsp_lines",
    },
    ["<C-y>"] = { "<esc>$a;<esc>:w<cr>", desc = "Insert ; at end of line" },
    ["<C-s>"] = { "<esc>:w<cr>a", desc = "Save File" },
    ["<C-t>"] = { "<esc>", desc = "Enter normal mode" },
    ["__"] = { "<esc>:w<cr>", desc = "Save File + Enter normal mode" },
    ["_("] = { "_", desc = "Underscore (single fix)" },
  },
  v = {
    ["<Bs>"] = { "x", desc = "Delete" }
  }
}
