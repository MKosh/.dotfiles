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
  initial_rows = 36,
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
    -- { -- example background file
    --   source = {
    --     File = wezterm.config_dir .. '/Firewatch_4k.png',
    --   },
    --   height = "Cover",
    --   width = "Cover",
    --   hsb = { brightness = 0.1 },
    -- },
    {
      source = {
        Gradient = {
          -- orientation = { Linear = { angle = 225.0 } },
          orientation = "Vertical",
          -- orientation = { Radial = {cx = 1.0, cy = 0.5, radius = 1.0 } },
          colors = {
            --------------------------------------------------------------------
            -- Teal Radial gradient
            -- '#3d6596', -- Brighter Tealish
            -- '#32527a', -- Tealish band
            -- '#19293d', -- Dark Tealish
            -- '#070b11', -- Darker Tealish
            -- '#0a1119', -- Darkest Tealish
            --------------------------------------------------------------------

            --------------------------------------------------------------------
            -- Teal vertical gradient
            '#19293d', -- Dark Tealish
            '#32527a', -- Tealish
            '#19293d', -- Dark Tealish
            '#070b11', -- Darker Tealish
            --------------------------------------------------------------------

            --------------------------------------------------------------------
            -- Original slanted gradient
            -- '#0f0c29', -- dark dark blue
            -- '#1d1944',
            -- '#2c275e',
            -- '#302b63',
            -- '#32527a', -- Tealish
            -- '#873011', -- Dark Orange
            -- '#24243e',
            -- '#0f0c29',
            --------------------------------------------------------------------

            --------------------------------------------------------------------
            -- Colors
            -- '#32527a', -- Tealish
            -- '#3d6596', -- Brighter Tealish
            -- '#19293d', -- Dark Tealish
            -- '#070b11', -- Darker Tealish
            -- '#0a1119', -- Darkest Tealish
            --
            -- '#0f0c29', -- dark dark blue
            -- '#ad3e16', -- Orange
            -- '#873011', -- Dark Orange
            --------------------------------------------------------------------

            -- '#19293d',
            -- '#0d1621',
            -- '#070b11',
          },
          -- interpolation = 'CatmullRom',
          interpolation = 'Linear',
        },
      },
      width = '100%',
      height= '100%',
      hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 1.0,
      },
    },
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
