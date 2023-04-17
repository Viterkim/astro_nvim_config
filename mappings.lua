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
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
    -- Viter
    ["<C-space>"] = {
      require("rust-tools").hover_actions.hover_actions,
      desc = "Rust Hover Actions"
    },
    -- vim.keymap.set('n', '<leader>cf', crates.show_features_popup, opts),
    ["<leader>ct"] = {
      function()
        require("crates").show_features_popup()
      end,
      desc = "Show rust crate features",
    },
    ["<leader>ø"] = { "<cmd>Navbuddy<cr>" }, -- change description but the same command
    ["<leader>æ"] = {
      function()
        require("lsp_lines").toggle()
      end,
      desc = "Toggle lsp_lines"
    },
    ["ø"] = {
      function()
        vim.lsp.buf.hover()
      end,
      desc = "Hover symbol details" },
    ["__"] = { ":w<cr>", desc = "Save File" },
    ["<S-Up>"] = { "<cmd>m-2<cr>", desc = "Moves line one up" },
    ["<S-Down>"] = { "<cmd>m+<cr>", desc = "Moves line one Down" },
    -- Harpoon
    ["<leader>h"] = false,
    ["<leader>ha"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      desc = "Harpoon add"
    },
    ["<leader>ht"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      desc = "Harpoon overview"
    },
  },
  i = {
    ["<C-s>"] = { "<esc>:w<cr>a", desc = "Save File" },
    ["<C-t>"] = { "<esc>:w<cr>" },
    ["__"] = { "<esc>:w<cr>", desc = "Save File + enter normal mode" },
  }
}
