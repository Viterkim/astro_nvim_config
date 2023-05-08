return {
  {
    "simrat39/rust-tools.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    ft = { "rust" },
    opts = function()

      local codelldb_path = vim.env.HOME .. "/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb"

      local liblldb_path
      if vim.loop.os_uname().sysname == "Darwin" then
        liblldb_path = vim.env.HOME .. "/.local/share/nvim/mason/packages/codelldb/extension/lldb/lib/liblldb.dylib"
      else
        liblldb_path = vim.env.HOME .. "/.local/share/nvim/mason/packages/codelldb/extension/lldb/lib/liblldb.so"
      end

      -- Feature stuff, but this breaks go to def, and ref
      -- server = {
      --   require("astronvim.utils.lsp").config "rust_analyzer",
      --   settings = {
      --     ['rust-analyzer'] = {
      --       cargo = {
      --         features = "all"
      --       }
      --     }
      --   }
      -- },
      return {
        server = require("astronvim.utils.lsp").config "rust_analyzer",
        dap = {
          adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
        },
      }
    end,
    config = true,
  },
}
