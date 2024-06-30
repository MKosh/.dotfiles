local wezterm = require('wezterm')

local act = wezterm.action
local config = {}

config.font = wezterm.font('JetBrains Mono')
config.font_size = 14
config.color_scheme = 'Afterglow'
config.default_cursor_style = 'SteadyBar'

config.keys = {
  -- paste from the clipboard
  { key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' }
}

return config
