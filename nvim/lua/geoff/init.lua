require("geoff.plugins")
require("geoff.lsp")

-- Set Claude API key from environment variable
vim.g.claude_api_key = os.getenv("ANTHROPIC_API_KEY")

-- nvim-tree configuration
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
    side = "left",
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  actions = {
    open_file = {
      quit_on_open = false,
    },
  },
})

-- Key mappings for file navigation
vim.keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>e', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>f', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

-- Telescope configuration for file searching
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules", ".git/" }
  }
}

-- Telescope key mappings
vim.keymap.set('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-f>', ':Telescope live_grep<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true })

-- Claude AI key mappings
vim.keymap.set('n', '<C-l>', ':ClaudeChat<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>ci', ':ClaudeImplement<CR>', { noremap = true, silent = true })

-- Lualine setup with Chariot theme integration
local chariot_theme = {
  normal = {
    a = { fg = '#ffffff', bg = '#7a5af1', gui = 'bold' }, -- brand_primary
    b = { fg = '#ffffff', bg = '#28205a' },                -- bg_secondary
    c = { fg = '#bbb9c3', bg = '#0d0d28' },                -- text_secondary, bg_primary
  },
  insert = {
    a = { fg = '#0d0d28', bg = '#10b981', gui = 'bold' }, -- green
    b = { fg = '#ffffff', bg = '#28205a' },
    c = { fg = '#bbb9c3', bg = '#0d0d28' },
  },
  visual = {
    a = { fg = '#ffffff', bg = '#9171f6', gui = 'bold' }, -- brand_secondary
    b = { fg = '#ffffff', bg = '#28205a' },
    c = { fg = '#bbb9c3', bg = '#0d0d28' },
  },
  replace = {
    a = { fg = '#ffffff', bg = '#ff7171', gui = 'bold' }, -- red
    b = { fg = '#ffffff', bg = '#28205a' },
    c = { fg = '#bbb9c3', bg = '#0d0d28' },
  },
  command = {
    a = { fg = '#0d0d28', bg = '#ffe559', gui = 'bold' }, -- yellow
    b = { fg = '#ffffff', bg = '#28205a' },
    c = { fg = '#bbb9c3', bg = '#0d0d28' },
  },
  inactive = {
    a = { fg = '#bbb9c3', bg = '#28205a' },
    b = { fg = '#bbb9c3', bg = '#28205a' },
    c = { fg = '#6c70a6', bg = '#0d0d28' }, -- text_disabled
  },
}

require('lualine').setup {
  options = {
    theme = chariot_theme,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { 'NvimTree', 'TelescopePrompt' },
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {'nvim-tree'}
}

-- Treesitter setup for better syntax highlighting
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'go', 'typescript', 'javascript', 'html', 'css', 'json', 'markdown',
    'lua', 'vim', 'python', 'yaml', 'toml', 'bash'
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
}
