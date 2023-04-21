return {
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
    event = "User Astrofile",
  },
  {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "saecki/crates.nvim",
  },
  {
    "mg979/vim-visual-multi"
  },
  {
    "folke/tokyonight.nvim"
  },
  {
    "ThePrimeagen/harpoon"
  },
  {
    "ThePrimeagen/vim-be-good"
  },
  {
    "nvim-lua/plenary.nvim"
  },
  {
    "nvim-pack/nvim-spectre"
  },
}
