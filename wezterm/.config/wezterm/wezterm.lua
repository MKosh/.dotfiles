local wezterm = require('wezterm')

local act = wezterm.action
local config = {}

config.font = wezterm.font('JetBrains Mono')
config.font_size = 16
-- config.color_scheme = 'Afterglow'
-- config.color_scheme = 'Sonokai (Gogh)'
config.color_scheme = 'Edge Dark (base16)'
-- config.color_scheme = 'Apprentice (Gogh)'
-- config.color_scheme = 'Andromeda'
config.default_cursor_style = 'SteadyBar'

config.keys = {
  -- paste from the clipboard
  { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
  -- copy from terminal
  { key = 'd', mods = 'CTRL', action = act.CopyTo 'ClipboardAndPrimarySelection' },
}

return config
