local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.max_fps = 120
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
config.font = wezterm.font("JetBrainsMonoNL Nerd Font Mono", { weight = "DemiBold" })
config.font_size = 16.0
config.freetype_load_target = "Light"
config.freetype_load_flags = "NO_HINTING"
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_frame = { font = wezterm.font("JetBrainsMonoNL Nerd Font Mono", { weight = "Regular" }), font_size = 13.0 }
config.scrollback_lines = 10000
config.audible_bell = "Disabled"

config.skip_close_confirmation_for_processes_named = {}
config.window_close_confirmation = "AlwaysPrompt"

config.colors = {
  background = "#000000",
  foreground = "#ffffff",
  cursor_bg = "#4e9a06",
  cursor_border = "#4e9a06",
  cursor_fg = "#000000",
  ansi = { "#000000", "#ff3333", "#33dd33", "#ffd000", "#3b78ff", "#d633ff", "#33dddd", "#ffffff" },
  brights = { "#808080", "#ff5555", "#55ff55", "#ffe855", "#5599ff", "#ff66ff", "#55ffff", "#ffffff" },
}
config.inactive_pane_hsb = { saturation = 0.5, brightness = 0.3 }

-- OS-specific settings and keybinds
if wezterm.target_triple:find("darwin") then
  require("macos")(config)
else
  require("linux")(config)
end

return config
