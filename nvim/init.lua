require("geoff")

-- Set up Chariot theme
require("chariot-theme").setup()

-- Basic Vim options
vim.o.number = true
vim.o.relativenumber = false
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.background = 'dark'

-- Key mapping to toggle between light and dark themes
vim.keymap.set('n', '<leader>tt', function()
  require("chariot-theme").toggle_theme()
end, { noremap = true, silent = true, desc = "Toggle light/dark theme" })

