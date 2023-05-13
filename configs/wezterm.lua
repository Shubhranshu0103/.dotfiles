-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Aurora'
config.font = wezterm.font 'Jetbrains Mono'
config.font_size = 16
config.line_height = 1.2
config.window_padding = {
  left = 2,
  right = 2,
  top = 0,
  bottom = 0
}
config.window_background_opacity = 0.85

wezterm.on('gui-startup', function()
  local _tab, _pane, window = wezterm.mux.spawn_window({})
  window:gui_window():maximize()
end)

-- and finally, return the configuration to wezterm
return config
