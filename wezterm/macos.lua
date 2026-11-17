local wezterm = require("wezterm")
local act = wezterm.action

return function(config)
  config.send_composed_key_when_left_alt_is_pressed = false

  config.keys = {
    { key = "Enter", mods = "SHIFT", action = act.SendString("\x1b\r") },
    { key = "d", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "d", mods = "CMD|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "w", mods = "CMD", action = act.CloseCurrentPane({ confirm = true }) },
    { key = "Enter", mods = "CMD|SHIFT", action = act.TogglePaneZoomState },
    { key = "c", mods = "CMD|SHIFT", action = act.ActivateCopyMode },
    { key = "[", mods = "CMD", action = act.ActivatePaneDirection("Prev") },
    { key = "]", mods = "CMD", action = act.ActivatePaneDirection("Next") },
    { key = "LeftArrow", mods = "CMD|OPT", action = act.ActivatePaneDirection("Left") },
    { key = "RightArrow", mods = "CMD|OPT", action = act.ActivatePaneDirection("Right") },
    { key = "UpArrow", mods = "CMD|OPT", action = act.ActivatePaneDirection("Up") },
    { key = "DownArrow", mods = "CMD|OPT", action = act.ActivatePaneDirection("Down") },
    { key = "t", mods = "CMD", action = act.SpawnTab("CurrentPaneDomain") },
    { key = "LeftArrow", mods = "CMD", action = act.ActivateTabRelative(-1) },
    { key = "RightArrow", mods = "CMD", action = act.ActivateTabRelative(1) },
    { key = "LeftArrow", mods = "CMD|SHIFT", action = act.MoveTabRelative(-1) },
    { key = "RightArrow", mods = "CMD|SHIFT", action = act.MoveTabRelative(1) },
    { key = "1", mods = "CMD", action = act.ActivateTab(0) },
    { key = "2", mods = "CMD", action = act.ActivateTab(1) },
    { key = "3", mods = "CMD", action = act.ActivateTab(2) },
    { key = "4", mods = "CMD", action = act.ActivateTab(3) },
    { key = "5", mods = "CMD", action = act.ActivateTab(4) },
    { key = "6", mods = "CMD", action = act.ActivateTab(5) },
    { key = "7", mods = "CMD", action = act.ActivateTab(6) },
    { key = "8", mods = "CMD", action = act.ActivateTab(7) },
    { key = "9", mods = "CMD", action = act.ActivateTab(8) },
    { key = "k", mods = "CMD", action = act.ClearScrollback("ScrollbackAndViewport") },
    { key = "=", mods = "CMD", action = act.IncreaseFontSize },
    { key = "-", mods = "CMD", action = act.DecreaseFontSize },
    { key = "0", mods = "CMD", action = act.ResetFontSize },
  }
end
