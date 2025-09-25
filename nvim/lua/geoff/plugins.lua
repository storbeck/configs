local lazy = require("lazy")

lazy.setup({
  -- LSP and autocomplete
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",

  -- Treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  -- File navigation
  "nvim-telescope/telescope.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-tree.lua",

  -- Status line
  "nvim-lualine/lualine.nvim",

  -- Markdown preview
  { "iamcco/markdown-preview.nvim", build = "cd app && npm install", ft = "markdown" },

  -- Go support
  "fatih/vim-go",

  -- Claude AI integration
  "pasky/claude.vim"
})

