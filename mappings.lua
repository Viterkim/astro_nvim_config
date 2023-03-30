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
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -- Viter
    ["k"] = { function() vim.lsp.buf.hover() end, desc = "Hover symbol details" },
    ["__"] = { ":w<cr>", desc = "Save File" },

    -- Frøs magi
    -- ["re"] = { "<cmd>RustRunnables<cr>", desc = "Open Rust Runnables" },
    -- ["rr"] = { "<cmd>RustRun<cr>", desc = "Quick run Rust" },
    -- ["rw"] = { "<cmd>RustDebuggables<cr>", desc = "Open Rust Debuggables" },
    -- ["<A-k>"] = { "<cmd>m-2<cr>", desc = "Moves line one up" },
    -- ["<A-j>"] = { "<cmd>m+<cr>", desc = "Moves line one Down" },
    -- -- LSP additional bindings for good shit
    -- ["<leader>lr"] = { vim.lsp.buf.rename, desc = "Rename" },
    -- ["øb"] = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- ["æb"] = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },
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
