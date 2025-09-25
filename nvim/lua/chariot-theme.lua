-- Chariot theme for Neovim in Lua
-- Matches WezTerm configuration and Chariot UI components

local M = {}

-- Chariot color palette (from CSS and WezTerm config)
local colors = {
  -- Light theme colors
  light = {
    bg_primary = '#ffffff',
    bg_secondary = '#ecf9fb',
    text_primary = '#0d0d28',
    text_secondary = '#7b7983',
    text_disabled = '#999998',
    brand_primary = '#5f47b7',
    brand_secondary = '#7a5af1',
    brand_tertiary = '#4936b1',
    stroke = '#d9d9e9',
  },

  -- Dark theme colors
  dark = {
    bg_primary = '#0d0d28',
    bg_secondary = '#28205a',
    text_primary = '#ffffff',
    text_secondary = '#bbb9c3',
    text_disabled = '#6c70a6',
    brand_primary = '#7a5af1',
    brand_secondary = '#9171f6',
    brand_tertiary = '#c3b7f1',
    stroke = '#4d507c',
  },

  -- Status colors (consistent across themes)
  red = '#ff7171',
  red_critical = '#b81628',
  green = '#10b981',
  yellow = '#ffe559',
  yellow_medium = '#827140',
  blue = '#5ca5ff',
  orange = '#c75523',
  cyan = '#64d0ad',
  cyan_dark = '#1e585e',
}

function M.get_colors()
  local bg = vim.o.background or 'dark'
  local theme_colors = colors[bg]

  return vim.tbl_extend('force', colors, theme_colors)
end

function M.setup()
  vim.cmd('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end

  vim.g.colors_name = 'chariot-theme'

  local c = M.get_colors()

  -- Helper function for setting highlight groups
  local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Basic highlighting
  hi('Normal', { fg = c.text_primary, bg = c.bg_primary })
  hi('NonText', { fg = c.text_secondary })
  hi('Cursor', { fg = c.bg_primary, bg = c.brand_primary })
  hi('CursorLine', { bg = c.bg_secondary })
  hi('CursorColumn', { bg = c.bg_secondary })
  hi('Visual', { bg = c.brand_primary })
  hi('VisualNOS', { bg = c.brand_primary })
  hi('Search', { fg = c.bg_primary, bg = c.yellow })
  hi('IncSearch', { fg = c.bg_primary, bg = c.orange })

  -- Line numbers
  hi('LineNr', { fg = c.text_secondary })
  hi('CursorLineNr', { fg = c.brand_primary, bold = true })

  -- Status line
  hi('StatusLine', { fg = c.text_primary, bg = c.bg_secondary })
  hi('StatusLineNC', { fg = c.text_secondary, bg = c.stroke })

  -- Vertical split
  hi('VertSplit', { fg = c.stroke })

  -- Popup menus
  hi('Pmenu', { fg = c.text_primary, bg = c.bg_secondary })
  hi('PmenuSel', { fg = c.bg_primary, bg = c.brand_primary })
  hi('PmenuSbar', { bg = c.stroke })
  hi('PmenuThumb', { bg = c.brand_primary })

  -- Tabs
  hi('TabLine', { fg = c.text_secondary, bg = c.bg_secondary })
  hi('TabLineFill', { bg = c.bg_secondary })
  hi('TabLineSel', { fg = c.text_primary, bg = c.bg_primary, bold = true })

  -- Folding
  hi('Folded', { fg = c.text_disabled, bg = c.bg_secondary })
  hi('FoldColumn', { fg = c.text_secondary, bg = c.bg_primary })

  -- Messages
  hi('ErrorMsg', { fg = c.red, bold = true })
  hi('WarningMsg', { fg = c.orange })
  hi('MoreMsg', { fg = c.green })
  hi('Question', { fg = c.blue })

  -- Syntax highlighting
  hi('Comment', { fg = c.text_disabled, italic = true })
  hi('String', { fg = c.green })
  hi('Character', { fg = c.green })
  hi('Number', { fg = c.orange })
  hi('Boolean', { fg = c.orange })
  hi('Float', { fg = c.orange })

  hi('Identifier', { fg = c.text_primary })
  hi('Function', { fg = c.blue })

  hi('Statement', { fg = c.brand_primary, bold = true })
  hi('Conditional', { fg = c.brand_primary })
  hi('Repeat', { fg = c.brand_primary })
  hi('Label', { fg = c.brand_primary })
  hi('Operator', { fg = c.text_primary })
  hi('Keyword', { fg = c.brand_primary })
  hi('Exception', { fg = c.red })

  hi('PreProc', { fg = c.brand_secondary })
  hi('Include', { fg = c.brand_secondary })
  hi('Define', { fg = c.brand_secondary })
  hi('Macro', { fg = c.brand_secondary })
  hi('PreCondit', { fg = c.brand_secondary })

  hi('Type', { fg = c.cyan })
  hi('StorageClass', { fg = c.cyan })
  hi('Structure', { fg = c.cyan })
  hi('Typedef', { fg = c.cyan })

  hi('Special', { fg = c.yellow })
  hi('SpecialChar', { fg = c.yellow })
  hi('Tag', { fg = c.yellow })
  hi('Delimiter', { fg = c.text_secondary })
  hi('SpecialComment', { fg = c.yellow })
  hi('Debug', { fg = c.red })

  -- Diff highlighting
  hi('DiffAdd', { fg = c.green, bg = c.bg_secondary })
  hi('DiffChange', { fg = c.yellow, bg = c.bg_secondary })
  hi('DiffDelete', { fg = c.red, bg = c.bg_secondary })
  hi('DiffText', { fg = c.orange, bg = c.bg_secondary, bold = true })

  -- Git signs (if using gitsigns.nvim)
  hi('GitSignsAdd', { fg = c.green })
  hi('GitSignsChange', { fg = c.yellow })
  hi('GitSignsDelete', { fg = c.red })

  -- LSP highlighting
  hi('DiagnosticError', { fg = c.red })
  hi('DiagnosticWarn', { fg = c.orange })
  hi('DiagnosticInfo', { fg = c.blue })
  hi('DiagnosticHint', { fg = c.cyan })

  hi('DiagnosticUnderlineError', { sp = c.red, underline = true })
  hi('DiagnosticUnderlineWarn', { sp = c.orange, underline = true })
  hi('DiagnosticUnderlineInfo', { sp = c.blue, underline = true })
  hi('DiagnosticUnderlineHint', { sp = c.cyan, underline = true })

  -- Telescope highlighting
  hi('TelescopeSelection', { bg = c.bg_secondary })
  hi('TelescopeSelectionCaret', { fg = c.brand_primary })
  hi('TelescopeMultiSelection', { bg = c.bg_secondary })
  hi('TelescopeMatching', { fg = c.yellow, bold = true })
  hi('TelescopeBorder', { fg = c.stroke })
  hi('TelescopeNormal', { fg = c.text_primary, bg = c.bg_primary })
  hi('TelescopePromptNormal', { fg = c.text_primary, bg = c.bg_secondary })
  hi('TelescopeResultsNormal', { fg = c.text_primary, bg = c.bg_primary })
  hi('TelescopePreviewNormal', { fg = c.text_primary, bg = c.bg_primary })

  -- Nvim-tree highlighting
  hi('NvimTreeNormal', { fg = c.text_primary, bg = c.bg_primary })
  hi('NvimTreeFolderName', { fg = c.blue })
  hi('NvimTreeOpenedFolderName', { fg = c.blue, bold = true })
  hi('NvimTreeExecFile', { fg = c.green })
  hi('NvimTreeSpecialFile', { fg = c.yellow })
  hi('NvimTreeImageFile', { fg = c.orange })
  hi('NvimTreeRootFolder', { fg = c.brand_primary, bold = true })
  hi('NvimTreeSymlink', { fg = c.cyan })
  hi('NvimTreeFolderIcon', { fg = c.blue })
  hi('NvimTreeIndentMarker', { fg = c.stroke })

  -- Lualine integration
  hi('LualineNormal', { fg = c.text_primary, bg = c.bg_secondary })
  hi('LualineInsert', { fg = c.bg_primary, bg = c.green })
  hi('LualineVisual', { fg = c.bg_primary, bg = c.brand_primary })
  hi('LualineReplace', { fg = c.bg_primary, bg = c.red })
  hi('LualineCommand', { fg = c.bg_primary, bg = c.yellow })

  -- Treesitter highlighting
  hi('@text', { fg = c.text_primary })
  hi('@text.strong', { bold = true })
  hi('@text.emphasis', { italic = true })
  hi('@text.underline', { underline = true })
  hi('@text.strike', { strikethrough = true })
  hi('@text.title', { fg = c.brand_primary, bold = true })
  hi('@text.literal', { fg = c.green })
  hi('@text.uri', { fg = c.blue, underline = true })

  hi('@comment', { fg = c.text_disabled, italic = true })
  hi('@punctuation', { fg = c.text_secondary })
  hi('@constant', { fg = c.orange })
  hi('@constant.builtin', { fg = c.orange })
  hi('@constant.macro', { fg = c.orange })
  hi('@string', { fg = c.green })
  hi('@string.escape', { fg = c.yellow })
  hi('@string.special', { fg = c.yellow })
  hi('@character', { fg = c.green })
  hi('@number', { fg = c.orange })
  hi('@boolean', { fg = c.orange })
  hi('@float', { fg = c.orange })

  hi('@function', { fg = c.blue })
  hi('@function.builtin', { fg = c.blue })
  hi('@function.macro', { fg = c.blue })
  hi('@method', { fg = c.blue })
  hi('@constructor', { fg = c.cyan })

  hi('@conditional', { fg = c.brand_primary })
  hi('@repeat', { fg = c.brand_primary })
  hi('@label', { fg = c.brand_primary })
  hi('@operator', { fg = c.text_primary })
  hi('@keyword', { fg = c.brand_primary })
  hi('@exception', { fg = c.red })

  hi('@variable', { fg = c.text_primary })
  hi('@variable.builtin', { fg = c.brand_secondary })
  hi('@type', { fg = c.cyan })
  hi('@type.definition', { fg = c.cyan })
  hi('@storageclass', { fg = c.cyan })
  hi('@structure', { fg = c.cyan })
  hi('@namespace', { fg = c.brand_secondary })
  hi('@include', { fg = c.brand_secondary })
  hi('@preproc', { fg = c.brand_secondary })
  hi('@debug', { fg = c.red })
  hi('@tag', { fg = c.brand_primary })

  -- Language specific highlighting
  -- Go
  hi('@function.go', { fg = c.blue })
  hi('@method.go', { fg = c.blue })
  hi('@type.go', { fg = c.cyan })
  hi('@field.go', { fg = c.text_primary })
  hi('@parameter.go', { fg = c.text_primary })

  -- TypeScript/JavaScript
  hi('@constructor.typescript', { fg = c.cyan })
  hi('@type.typescript', { fg = c.cyan })
  hi('@property.typescript', { fg = c.text_primary })

  -- HTML
  hi('@tag.html', { fg = c.brand_primary })
  hi('@tag.attribute.html', { fg = c.blue })
  hi('@tag.delimiter.html', { fg = c.text_secondary })

  -- CSS
  hi('@property.css', { fg = c.text_primary })
  hi('@type.css', { fg = c.blue })
  hi('@string.css', { fg = c.green })

  -- Markdown
  hi('@text.title.1.markdown', { fg = c.brand_primary, bold = true })
  hi('@text.title.2.markdown', { fg = c.brand_secondary, bold = true })
  hi('@text.title.3.markdown', { fg = c.blue, bold = true })
  hi('@text.literal.markdown', { fg = c.green, bg = c.bg_secondary })
  hi('@text.uri.markdown', { fg = c.blue, underline = true })

end

-- Function to toggle between light and dark themes
function M.toggle_theme()
  if vim.o.background == 'dark' then
    vim.o.background = 'light'
  else
    vim.o.background = 'dark'
  end
  M.setup()
end

-- Set up automatic theme switching based on system appearance (if available)
function M.setup_auto_theme()
  -- This would need additional system integration
  -- For now, just set up the theme
  M.setup()
end

return M