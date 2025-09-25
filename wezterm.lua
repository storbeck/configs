local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Custom Chariot color schemes inspired by web UI
local chariot_light = {
  foreground = '#0d0d28',  -- chariot-text-primary
  background = '#ffffff',  -- chariot-background-primary
  cursor_bg = '#5f47b7',   -- chariot-brand-primary
  cursor_fg = '#ffffff',
  cursor_border = '#5f47b7',
  selection_fg = '#ffffff',
  selection_bg = '#5f47b7',
  scrollbar_thumb = '#d9d9e9',  -- chariot-stroke
  split = '#d9d9e9',

  ansi = {
    '#0d0d28',    -- black (text-primary)
    '#ac1212',    -- red (text-red)
    '#0d9467',    -- green (stroke-info)
    '#f2e559',    -- yellow (stroke-medium)
    '#2e7ddd',    -- blue (stroke-blue)
    '#5f47b7',    -- magenta (brand-primary)
    '#64d0ad',    -- cyan (status-info)
    '#7b7983',    -- white (text-secondary)
  },
  brights = {
    '#4d5074',    -- bright black
    '#ff7171',    -- bright red
    '#10b981',    -- bright green
    '#ffe559',    -- bright yellow
    '#5ca5ff',    -- bright blue
    '#7a5af1',    -- bright magenta (brand-secondary)
    '#64d0ad',    -- bright cyan
    '#ffffff',    -- bright white
  },

  tab_bar = {
    background = '#ffffff',  -- clean white background
    active_tab = {
      bg_color = '#ecf9fb',  -- subtle background highlight
      fg_color = '#0d0d28',  -- dark text
      intensity = 'Bold',
    },
    inactive_tab = {
      bg_color = '#ffffff',  -- matches main background
      fg_color = '#7b7983',  -- chariot-text-secondary
    },
    inactive_tab_hover = {
      bg_color = '#ecf9fb',  -- subtle hover effect
      fg_color = '#0d0d28',
    },
    new_tab = {
      bg_color = '#ffffff',
      fg_color = '#7b7983',
    },
    new_tab_hover = {
      bg_color = '#ecf9fb',
      fg_color = '#0d0d28',
    },
  },
}

local chariot_dark = {
  foreground = '#ffffff',  -- white text for better visibility
  background = '#0d0d28',  -- chariot-background-primary (dark)
  cursor_bg = '#7a5af1',   -- chariot-brand-primary (dark)
  cursor_fg = '#0d0d28',
  cursor_border = '#7a5af1',
  selection_fg = '#0d0d28',
  selection_bg = '#7a5af1',
  scrollbar_thumb = '#4d507c',  -- chariot-stroke (dark)
  split = '#4d507c',

  ansi = {
    '#0d0d28',    -- black
    '#ff7171',    -- red (text-red dark)
    '#10b981',    -- green (stroke-info dark)
    '#827140',    -- yellow (stroke-medium dark)
    '#5ca5ff',    -- blue (stroke-blue dark)
    '#9171f6',    -- magenta (text-purple dark)
    '#1e585e',    -- cyan (status-info dark)
    '#bbb9c3',    -- white (text-secondary dark)
  },
  brights = {
    '#6c70a6',    -- bright black (text-disabled dark)
    '#b81628',    -- bright red (stroke-critical dark)
    '#10b981',    -- bright green
    '#c75523',    -- bright yellow (stroke-high dark)
    '#5ca5ff',    -- bright blue
    '#c3b7f1',    -- bright magenta (brand-tertiary dark)
    '#1e585e',    -- bright cyan
    '#ffffff',    -- bright white
  },

  tab_bar = {
    background = '#0d0d28',  -- darker background like your image
    active_tab = {
      bg_color = '#4d507c',  -- subtle highlight for active tab
      fg_color = '#ffffff',
      intensity = 'Bold',
    },
    inactive_tab = {
      bg_color = '#0d0d28',  -- matches main background
      fg_color = '#bbb9c3',  -- chariot-text-secondary (dark)
    },
    inactive_tab_hover = {
      bg_color = '#28205a',  -- subtle hover effect
      fg_color = '#ffffff',
    },
    new_tab = {
      bg_color = '#0d0d28',
      fg_color = '#7b7983',
    },
    new_tab_hover = {
      bg_color = '#28205a',
      fg_color = '#ffffff',
    },
  },
}

-- Auto-detect system theme and set colors accordingly
local function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

local function scheme_for_appearance(appearance)
  if appearance:find('Dark') then
    return chariot_dark
  else
    return chariot_light
  end
end

config.colors = scheme_for_appearance(get_appearance())

-- Font configuration for a clean look
config.font = wezterm.font('JetBrains Mono')
config.font_size = 14.0
config.line_height = 1.25

config.window_background_opacity = 1.0
config.window_decorations = 'TITLE | RESIZE'
config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 8,
}

-- Tab bar configuration
config.hide_tab_bar_if_only_one_tab = true 
config.use_fancy_tab_bar = false
config.tab_max_width = 60
config.tab_bar_at_bottom = false

-- Cursor styling
config.default_cursor_style = 'SteadyBlock'

-- Scrollback
config.scrollback_lines = 10000

-- Performance
config.max_fps = 120
config.animation_fps = 60

-- Initial window size
config.initial_cols = 120
config.initial_rows = 32

-- Auto-update theme when system appearance changes
wezterm.on('window-config-reloaded', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  local appearance = get_appearance()
  local new_colors = scheme_for_appearance(appearance)
  if overrides.colors ~= new_colors then
    overrides.colors = new_colors
    window:set_config_overrides(overrides)
  end
end)

-- Manual theme toggle function (still available with CMD+SHIFT+T)
wezterm.on('toggle-theme', function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if overrides.colors == chariot_light or not overrides.colors then
    overrides.colors = chariot_dark
  else
    overrides.colors = chariot_light
  end
  window:set_config_overrides(overrides)
end)

-- Key bindings
config.keys = {
  {key="v", mods="CMD", action=wezterm.action.PasteFrom("Clipboard")},
}

return config
