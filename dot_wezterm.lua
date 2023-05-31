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
config.color_scheme = 'Kanagawa (Gogh)'
config.window_background_opacity = 1.0
config.macos_window_background_blur = 80
config.command_palette_font_size = 18

-- config.font = wezterm.font 'Fira Code'

config.font = wezterm.font_with_fallback {
    { family = 'Iosevka', weight = 'Regular' },
    { family = 'Fira Code', weight = 'Regular' },
    'Noto Color Emoji',
  }
config.font_size = 17

config.keys = {
    -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
    {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
    -- Make Option-Right equivalent to Alt-f; forward-word
    {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
}

-- and finally, return the configuration to wezterm
return config

