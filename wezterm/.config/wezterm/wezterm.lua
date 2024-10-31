local wezterm = require('wezterm')

local act = wezterm.action

local is_darwin = function()
  return wezterm.target_triple:find("darwin") ~= nil
end

local size = 11
if is_darwin() then
  size = 16
end
local config = {
  initial_rows = 48,
  initial_cols = 120,

  window_padding = {
    bottom = 0,
  },
  font = wezterm.font('JetBrains Mono'),
  font_size = size,

  default_cursor_style = 'BlinkingBar',

  -- other options: Afterglow, Sonokai (Gogh), Apprentice (Gogh), Andromeda
  color_scheme = 'Edge Dark (base16)',

  enable_scroll_bar = true,
  enable_tab_bar = false,

  background = {
    {
      source = {
        Gradient = {
          orientation = { Linear = { angle = -45.0 } },
          colors = {
            '#0f0c29',
            '#1d1944',
            '#2c275e',
            '#302b63',
            '#32527a', -- Blue band
            -- '#ad3e16', -- Orange band
            '#873011', -- Dark Orange band
            '#24243e',
            '#0f0c29',
          },
          interpolation = 'CatmullRom',
        },
      },
      width = '100%',
      height= '100%',
      hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 0.8,
      },
    },
    -- {
    --   source = { Color = "black"},
    --   -- source = { Color = 'rgba(50,50,50,0.5)'},
    --   opacity = 0.3,
    --   width = '100%',
    --   height= '100%',
    -- },
  },

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
