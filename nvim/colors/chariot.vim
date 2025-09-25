" Chariot colorscheme for Neovim
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "chariot"

" Light theme colors
let s:chariot_bg_primary_light = '#ffffff'
let s:chariot_bg_secondary_light = '#ecf9fb'
let s:chariot_text_primary_light = '#0d0d28'
let s:chariot_text_secondary_light = '#7b7983'
let s:chariot_brand_primary_light = '#5f47b7'
let s:chariot_brand_secondary_light = '#7a5af1'
let s:chariot_stroke_light = '#d9d9e9'

" Dark theme colors
let s:chariot_bg_primary_dark = '#0d0d28'
let s:chariot_bg_secondary_dark = '#28205a'
let s:chariot_text_primary_dark = '#ffffff'
let s:chariot_text_secondary_dark = '#bbb9c3'
let s:chariot_text_disabled_dark = '#6c70a6'
let s:chariot_brand_primary_dark = '#7a5af1'
let s:chariot_brand_secondary_dark = '#9171f6'
let s:chariot_brand_tertiary_dark = '#c3b7f1'
let s:chariot_stroke_dark = '#4d507c'

" Status colors 
let s:chariot_red = '#ff7171'
let s:chariot_green = '#10b981'
let s:chariot_yellow = '#ffe559'
let s:chariot_blue = '#5ca5ff'
let s:chariot_orange = '#c75523'
let s:chariot_cyan = '#64d0ad'

" Auto-detect background preference
if &background == 'light'
  let s:bg_primary = s:chariot_bg_primary_light
  let s:bg_secondary = s:chariot_bg_secondary_light
  let s:text_primary = s:chariot_text_primary_light
  let s:text_secondary = s:chariot_text_secondary_light
  let s:brand_primary = s:chariot_brand_primary_light
  let s:brand_secondary = s:chariot_brand_secondary_light
  let s:stroke = s:chariot_stroke_light
  let s:comment = s:chariot_text_secondary_light
else
  let s:bg_primary = s:chariot_bg_primary_dark
  let s:bg_secondary = s:chariot_bg_secondary_dark
  let s:text_primary = s:chariot_text_primary_dark
  let s:text_secondary = s:chariot_text_secondary_dark
  let s:brand_primary = s:chariot_brand_primary_dark
  let s:brand_secondary = s:chariot_brand_secondary_dark
  let s:stroke = s:chariot_stroke_dark
  let s:comment = s:chariot_text_disabled_dark
endif

" Helper function for setting highlight groups
function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfunction

" Basic highlighting
call s:hi("Normal", s:text_primary, s:bg_primary, "", "", "", "")
call s:hi("NonText", s:text_secondary, "", "", "", "", "")
call s:hi("Cursor", s:bg_primary, s:brand_primary, "", "", "", "")
call s:hi("CursorLine", "", s:bg_secondary, "", "", "none", "")
call s:hi("CursorColumn", "", s:bg_secondary, "", "", "", "")
call s:hi("Visual", "", s:brand_primary, "", "", "", "")
call s:hi("VisualNOS", "", s:brand_primary, "", "", "", "")
call s:hi("Search", s:bg_primary, s:chariot_yellow, "", "", "", "")
call s:hi("IncSearch", s:bg_primary, s:chariot_orange, "", "", "", "")

" Line numbers
call s:hi("LineNr", s:text_secondary, "", "", "", "", "")
call s:hi("CursorLineNr", s:brand_primary, "", "", "", "bold", "")

" Status line
call s:hi("StatusLine", s:text_primary, s:bg_secondary, "", "", "", "")
call s:hi("StatusLineNC", s:text_secondary, s:stroke, "", "", "", "")

" Vertical split
call s:hi("VertSplit", s:stroke, "", "", "", "", "")

" Popup menus
call s:hi("Pmenu", s:text_primary, s:bg_secondary, "", "", "", "")
call s:hi("PmenuSel", s:bg_primary, s:brand_primary, "", "", "", "")
call s:hi("PmenuSbar", "", s:stroke, "", "", "", "")
call s:hi("PmenuThumb", "", s:brand_primary, "", "", "", "")

" Tabs
call s:hi("TabLine", s:text_secondary, s:bg_secondary, "", "", "", "")
call s:hi("TabLineFill", "", s:bg_secondary, "", "", "", "")
call s:hi("TabLineSel", s:text_primary, s:bg_primary, "", "", "bold", "")

" Folding
call s:hi("Folded", s:comment, s:bg_secondary, "", "", "", "")
call s:hi("FoldColumn", s:text_secondary, s:bg_primary, "", "", "", "")

" Messages
call s:hi("ErrorMsg", s:chariot_red, "", "", "", "bold", "")
call s:hi("WarningMsg", s:chariot_orange, "", "", "", "", "")
call s:hi("MoreMsg", s:chariot_green, "", "", "", "", "")
call s:hi("Question", s:chariot_blue, "", "", "", "", "")

" Syntax highlighting
call s:hi("Comment", s:comment, "", "", "", "italic", "")
call s:hi("String", s:chariot_green, "", "", "", "", "")
call s:hi("Character", s:chariot_green, "", "", "", "", "")
call s:hi("Number", s:chariot_orange, "", "", "", "", "")
call s:hi("Boolean", s:chariot_orange, "", "", "", "", "")
call s:hi("Float", s:chariot_orange, "", "", "", "", "")

call s:hi("Identifier", s:text_primary, "", "", "", "", "")
call s:hi("Function", s:chariot_blue, "", "", "", "", "")

call s:hi("Statement", s:brand_primary, "", "", "", "bold", "")
call s:hi("Conditional", s:brand_primary, "", "", "", "", "")
call s:hi("Repeat", s:brand_primary, "", "", "", "", "")
call s:hi("Label", s:brand_primary, "", "", "", "", "")
call s:hi("Operator", s:text_primary, "", "", "", "", "")
call s:hi("Keyword", s:brand_primary, "", "", "", "", "")
call s:hi("Exception", s:chariot_red, "", "", "", "", "")

call s:hi("PreProc", s:brand_secondary, "", "", "", "", "")
call s:hi("Include", s:brand_secondary, "", "", "", "", "")
call s:hi("Define", s:brand_secondary, "", "", "", "", "")
call s:hi("Macro", s:brand_secondary, "", "", "", "", "")
call s:hi("PreCondit", s:brand_secondary, "", "", "", "", "")

call s:hi("Type", s:chariot_cyan, "", "", "", "", "")
call s:hi("StorageClass", s:chariot_cyan, "", "", "", "", "")
call s:hi("Structure", s:chariot_cyan, "", "", "", "", "")
call s:hi("Typedef", s:chariot_cyan, "", "", "", "", "")

call s:hi("Special", s:chariot_yellow, "", "", "", "", "")
call s:hi("SpecialChar", s:chariot_yellow, "", "", "", "", "")
call s:hi("Tag", s:chariot_yellow, "", "", "", "", "")
call s:hi("Delimiter", s:text_secondary, "", "", "", "", "")
call s:hi("SpecialComment", s:chariot_yellow, "", "", "", "", "")
call s:hi("Debug", s:chariot_red, "", "", "", "", "")

" Diff highlighting
call s:hi("DiffAdd", s:chariot_green, s:bg_secondary, "", "", "", "")
call s:hi("DiffChange", s:chariot_yellow, s:bg_secondary, "", "", "", "")
call s:hi("DiffDelete", s:chariot_red, s:bg_secondary, "", "", "", "")
call s:hi("DiffText", s:chariot_orange, s:bg_secondary, "", "", "bold", "")

" Git signs (if using gitsigns.nvim)
call s:hi("GitSignsAdd", s:chariot_green, "", "", "", "", "")
call s:hi("GitSignsChange", s:chariot_yellow, "", "", "", "", "")
call s:hi("GitSignsDelete", s:chariot_red, "", "", "", "", "")

" LSP highlighting
call s:hi("DiagnosticError", s:chariot_red, "", "", "", "", "")
call s:hi("DiagnosticWarn", s:chariot_orange, "", "", "", "", "")
call s:hi("DiagnosticInfo", s:chariot_blue, "", "", "", "", "")
call s:hi("DiagnosticHint", s:chariot_cyan, "", "", "", "", "")

" Telescope highlighting
call s:hi("TelescopeSelection", "", s:bg_secondary, "", "", "", "")
call s:hi("TelescopeSelectionCaret", s:brand_primary, "", "", "", "", "")
call s:hi("TelescopeMultiSelection", "", s:bg_secondary, "", "", "", "")
call s:hi("TelescopeMatching", s:chariot_yellow, "", "", "", "bold", "")

" Nvim-tree highlighting
call s:hi("NvimTreeNormal", s:text_primary, s:bg_primary, "", "", "", "")
call s:hi("NvimTreeFolderName", s:chariot_blue, "", "", "", "", "")
call s:hi("NvimTreeOpenedFolderName", s:chariot_blue, "", "", "", "bold", "")
call s:hi("NvimTreeExecFile", s:chariot_green, "", "", "", "", "")
call s:hi("NvimTreeSpecialFile", s:chariot_yellow, "", "", "", "", "")
call s:hi("NvimTreeImageFile", s:chariot_orange, "", "", "", "", "")
call s:hi("NvimTreeRootFolder", s:brand_primary, "", "", "", "bold", "")

" Markdown highlighting
call s:hi("markdownHeadingDelimiter", s:brand_primary, "", "", "", "bold", "")
call s:hi("markdownH1", s:brand_primary, "", "", "", "bold", "")
call s:hi("markdownH2", s:brand_secondary, "", "", "", "bold", "")
call s:hi("markdownH3", s:chariot_blue, "", "", "", "bold", "")
call s:hi("markdownCode", s:chariot_green, s:bg_secondary, "", "", "", "")
call s:hi("markdownCodeBlock", s:chariot_green, s:bg_secondary, "", "", "", "")
call s:hi("markdownLink", s:chariot_blue, "", "", "", "underline", "")
call s:hi("markdownURL", s:text_secondary, "", "", "", "underline", "")

" Go syntax highlighting
call s:hi("goPackage", s:brand_primary, "", "", "", "", "")
call s:hi("goImport", s:brand_secondary, "", "", "", "", "")
call s:hi("goVar", s:brand_primary, "", "", "", "", "")
call s:hi("goConst", s:chariot_orange, "", "", "", "", "")
call s:hi("goDeclaration", s:brand_primary, "", "", "", "", "")
call s:hi("goDeclType", s:chariot_cyan, "", "", "", "", "")
call s:hi("goBuiltins", s:chariot_blue, "", "", "", "", "")

" TypeScript/JavaScript highlighting
call s:hi("typescriptImport", s:brand_secondary, "", "", "", "", "")
call s:hi("typescriptExport", s:brand_secondary, "", "", "", "", "")
call s:hi("typescriptVariable", s:brand_primary, "", "", "", "", "")
call s:hi("typescriptArrowFunc", s:brand_primary, "", "", "", "", "")
call s:hi("typescriptBraces", s:text_secondary, "", "", "", "", "")
call s:hi("typescriptParens", s:text_secondary, "", "", "", "", "")

" HTML/XML highlighting
call s:hi("htmlTag", s:text_secondary, "", "", "", "", "")
call s:hi("htmlEndTag", s:text_secondary, "", "", "", "", "")
call s:hi("htmlTagName", s:brand_primary, "", "", "", "", "")
call s:hi("htmlArg", s:chariot_blue, "", "", "", "", "")
call s:hi("htmlString", s:chariot_green, "", "", "", "", "")

" CSS highlighting
call s:hi("cssClassName", s:chariot_blue, "", "", "", "", "")
call s:hi("cssIdentifier", s:chariot_cyan, "", "", "", "", "")
call s:hi("cssProperty", s:text_primary, "", "", "", "", "")
call s:hi("cssValue", s:chariot_green, "", "", "", "", "")
call s:hi("cssColor", s:chariot_orange, "", "", "", "", "")
