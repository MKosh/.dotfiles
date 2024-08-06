local wezterm = require('wezterm')

local act = wezterm.action
local config = {
  font = wezterm.font('JetBrains Mono'),
  font_size = 12,
  default_cursor_style = 'BlinkingBar',

  -- other options: Afterglow, Sonokai (Gogh), Apprentice (Gogh), Andromeda
  color_scheme = 'Edge Dark (base16)',

  enable_tab_bar = false,

  window_background_opacity = 0.95,

  colors = {
    selection_fg = 'black',
    selection_bg = '#fffacd',
  },

  leader = { key = ' ', mods = 'ALT', timeout_milliseconds = 1000 },
  keys = {
    { key = 'v', mods = 'CTRL',   action = act.PasteFrom 'Clipboard' },
    { key = 'd', mods = 'CTRL',   action = act.CopyTo 'ClipboardAndPrimarySelection' },
    { key = 't', mods = 'LEADER', action = act({ SpawnCommandInNewTab = { cwd = wezterm.home_dir }})},
    { key = 'w', mods = 'LEADER', action = act.CloseCurrentPane { confirm = true } },
    { key ='\\', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = '-', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
    { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection 'Left' },
    { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection 'Down' },
    { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection 'Up' },
    { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection 'Right' },
  }
}

return config
