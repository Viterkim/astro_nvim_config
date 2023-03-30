return {
  { 
    "petertriho/nvim-scrollbar", 
    config = function()
      require("scrollbar").setup()
    end,
    lazy = false,
  },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
    lazy = false,
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup({
        vim.diagnostic.config({
          virtual_text = false,
        }),
      })
    end,
    event = "User Astrofile",
  },
  {
    "princejoogie/dir-telescope.nvim",
    -- telescope.nvim is a required dependency
    requires = {"nvim-telescope/telescope.nvim"},
    config = function()
      require("dir-telescope").setup({
        -- these are the default options set
        hidden = true,
        no_ignore = false,
        show_preview = true,
      })
    end,
    lazy = false,
  },
  {
    "neo-tree.nvim",
    config = function()
      require('neo-tree').setup({
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
            open_on_setup = true,
            open_on_setup_file = false
          }
        }
      })
    end,
  },
  {
   "nvim-telescope/telescope.nvim",
   config = function()
    require('telescope').setup({
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          "target"
        }
      }
    })
    end,
  },
  {
    "simrat39/rust-tools.nvim", -- add lsp plugin
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "rust_analyzer" },
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
    },
  }

  -- navbuddy not working
  -- { "SmiteshP/nvim-navic", opts = {}, event = "User Astrofile" }, 
  -- { "MunifTanjim/nui.nvim", opts = {}, event = "User Astrofile" }, 
  -- {
  --   "SmiteshP/nvim-navbuddy",
  --   requires = {
  --     "neovim/nvim-lspconfig",
  --     "SmiteshP/nvim-navic",
  --     "MunifTanjim/nui.nvim"
  -- },
  --   config = function()
  --     require("nvim-navbuddy").setup({
  --       lsp = {
  --         auto_attach = false,  -- If set to true, you don't need to manually use attach function
  --         preference = nil      -- list of lsp server names in order of preference
  --       },
  --     })
  --   end,
  --   event = "User Astrofile",
  -- }
}
