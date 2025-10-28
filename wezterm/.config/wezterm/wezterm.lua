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

  -- other options: Afterglow, Sonokai (Gogh), Apprentice (Gogh), Andromeda, Edge Dark (base16), Nord (Gogh), catppuccin-macchiato, Spacedust, SpaceGray Eighties, Everforest Dark (Gogh), Atom One Dark
  -- color_scheme = 'nordfox',
  color_scheme = 'Dark+',

  enable_scroll_bar = true,
  enable_tab_bar = false,

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
    { key = 'LeftArrow',  mods = 'CTRL', action = act.AdjustPaneSize { 'Left', 5} },
    { key = 'DownArrow',  mods = 'CTRL', action = act.AdjustPaneSize { 'Down', 5} },
    { key = 'UpArrow',    mods = 'CTRL', action = act.AdjustPaneSize { 'Up', 5} },
    { key = 'RightArrow', mods = 'CTRL', action = act.AdjustPaneSize { 'Right', 5} },
  }
}

return config
