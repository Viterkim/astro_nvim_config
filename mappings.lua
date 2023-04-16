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
    ["<leader>ø"] = { "<cmd>Navbuddy<cr>" }, -- change description but the same command
    ["<leader>æ"] = {
      function()
        require("lsp_lines").toggle()
      end,
      desc = "Toggle lsp_lines"
    },
    ["k"] = { function() vim.lsp.buf.hover() end, desc = "Hover symbol details" },
    ["__"] = { ":w<cr>", desc = "Save File" },
    ["<S-Up>"] = { "<cmd>m-2<cr>", desc = "Moves line one up" },
    ["<S-Down>"] = { "<cmd>m+<cr>", desc = "Moves line one Down" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  -- Viter
  i = {
    ["<C-s>"] = { "<esc>:w<cr>a", desc = "Save File" },
    ["<C-t>"] = { "<esc>" },
    ["__"] = { "<esc>:w<cr>", desc = "Save File + enter normal mode" },
  }
}
