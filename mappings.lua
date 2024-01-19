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
    ["<C-y>"] = {
      function() require("lsp_lines").toggle() end,
      desc = "Toggle lsp_lines",
    },
    ["<C-b>"] = { "<esc>$a;<esc>", desc = "Insert ; at end of line" },
    ["<C-space>"] = {
      require("rust-tools").hover_actions.hover_actions,
      desc = "Rust Hover Actions",
    },
    ["<C-t>"] = { "<esc>", desc = "For spamming to get out of stuff(we are already in normal mode)" },

    -- Own leadea i
    ["<leader>if"] = {
      function() vim.lsp.buf.code_action() end,
      desc = "LSP Fixes",
    },
    ["<leader>id"] = {
      function() vim.diagnostic.open_float() end,
      desc = "Float full diagnostics",
    },
    ["<leader>ii"] = { 
      function() require("telescope.builtin").diagnostics() end, 
      desc = "All diagnostics" 
    },
    ["<leader>ip"] = {
      function() require("telescope.builtin").diagnostics() end,
      desc = "Search diagnostics",
    },
    ["<leader>io"] = {
      function() require("crates").show_features_popup() end,
      desc = "Show rust crate features",
    },
    ["<leader>iy"] = { "<cmd>let @+=expand('%:~:.')<cr>", desc = "Copy relative path" },
    -- This one doesn't work half the time
    ["<leader>ix"] = { "<cmd>e ++ff=unix<cr>", desc = "Fix windows endlines" },

    -- Keys
    ["p"] = { "P", desc = "Paste" },
    ["ø"] = {
      function() vim.lsp.buf.hover() end,
      desc = "Hover symbol details",
    },
    ["__"] = { ":w<cr>", desc = "Save File" },
    ["<Bs>"] = { "x", desc = "Delete" },
    ["de"] = { "<S-v>ygvd", desc = "Cut" },

    -- Shift
    ["<S-Up>"] = { "<cmd>m-2<cr>", desc = "Moves line one up" },
    ["<S-Down>"] = { "<cmd>m+<cr>", desc = "Moves line one Down" },
    ["<S-l>"] = {
      "<cmd>:call vm#commands#add_cursor_up(0, 1)<cr>",
      desc = "Multicursor up"
    },
    ["<S-u>"] = {
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
    ["st"] = {
        function()
            require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
        end,
        desc = "Next buffer"
    },
    ["ss"] = {
        function()
            require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
        end,
        desc = "Previous buffer"
    },

    -- Remote sshfs
    ["<leader>sc"] = {
      function() 
        require("remote-sshfs.api").connect() 
      end,
      desc = "Remote Sshfs Connect",
    },
    ["<leader>sd"] = {
      function() 
        require("remote-sshfs.api").disconnect() 
      end,
      desc = "Remote Sshfs Disconnect",
    },
    ["<leader>se"] = {
      function() 
        require("remote-sshfs.api").edit()
      end,
      desc = "Remote Sshfs Edit",
    },

    -- Multiple Cursors
    ["<C-l>"] = { "<Cmd>MultipleCursorsAddUp<CR>", desc = "Multi Cursor Add Up" },
    ["<C-u>"] = { "<Cmd>MultipleCursorsAddDown<CR>", desc = "Multi Cursor Add Down" },
    ["<C-n>"] = { "<Cmd>MultipleCursorsAddBySearch<CR>", desc = "Multi Cursor By Search" },
    ["<C-m>"] = { "<Cmd>MultipleCursorsAddBySearchV<CR>", desc = "Multi Cursor By Search Limited" },
  },
  i = {
    ["<C-y>"] = {
      function() require("lsp_lines").toggle() end,
      desc = "Toggle lsp_lines",
    },
    ["<C-b>"] = { "<esc>$a;<esc>:w<cr>", desc = "Insert ; at end of line" },
    ["<C-s>"] = { "<esc>:w<cr>a", desc = "Save File" },
    ["<C-t>"] = { "<esc>", desc = "Enter normal mode" },
    ["<C-p>"] = { "<esc>lp", desc = "Paste" },
    ["__"] = { "<esc>:w<cr>", desc = "Save File + Enter normal mode" },
    ["_("] = { "_", desc = "Underscore (single fix)" },
  },
  v = {
    ["<S-Up>"] = { "<cmd>m-2<cr>", desc = "Moves line one up" },
    ["<S-Down>"] = { "<cmd>m+<cr>", desc = "Moves line one Down" },
    ["<C-y>"] = {
      function() require("lsp_lines").toggle() end,
      desc = "Toggle lsp_lines",
    },
    ["<C-t>"] = { "<esc>", desc = "Enter normal mode" },
    ["<C-b>"] = { "<esc>$a;<esc>", desc = "Insert ; at end of line" },
    ["__"] = { "<esc>:w<cr>", desc = "Save File + Enter normal mode" },
    ["<Bs>"] = { "x", desc = "Delete" },
    ["e"] = { "ygvd", desc = "Cut" },
    ["c"] = { "ygv", desc = "Copy + Keep selection" },
    ["p"] = { "P", desc = "Paste" },

    -- Multiple Cursors
    ["<C-l>"] = { "<Cmd>MultipleCursorsAddUp<CR>", desc = "Multi Cursor Add Up" },
    ["<C-u>"] = { "<Cmd>MultipleCursorsAddDown<CR>", desc = "Multi Cursor Add Down" },
    ["<C-n>"] = { "<Cmd>MultipleCursorsAddBySearch<CR>", desc = "Multi Cursor By Search" },
    ["<C-m>"] = { "<Cmd>MultipleCursorsAddBySearchV<CR>", desc = "Multi Cursor By Search Limited" },
  }
}
