local wezterm = require("wezterm")
local act = wezterm.action

return function(config)
  config.keys = {
    { key = "Enter", mods = "SHIFT", action = act.SendString("\x1b\r") },
    -- Ctrl+C copies if text is selected, otherwise interrupts
    { key = "c", mods = "CTRL", action = wezterm.action_callback(function(window, pane)
        if window:get_selection_text_for_pane(pane) ~= "" then
          window:perform_action(act.CopyTo("Clipboard"), pane)
          window:perform_action(act.ClearSelection, pane)
        else
          window:perform_action(act.SendKey({ key = "c", mods = "CTRL" }), pane)
        end
      end) },
    { key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },
    { key = "d", mods = "ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "D", mods = "ALT|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "w", mods = "ALT", action = act.CloseCurrentPane({ confirm = true }) },
    { key = "Enter", mods = "ALT|SHIFT", action = act.TogglePaneZoomState },
    { key = "C", mods = "ALT|SHIFT", action = act.ActivateCopyMode },
    { key = "[", mods = "ALT", action = act.ActivatePaneDirection("Prev") },
    { key = "]", mods = "ALT", action = act.ActivatePaneDirection("Next") },
    { key = "t", mods = "ALT", action = act.SpawnTab("CurrentPaneDomain") },
    { key = "k", mods = "ALT", action = act.ClearScrollback("ScrollbackAndViewport") },
    { key = "=", mods = "CTRL", action = act.IncreaseFontSize },
    { key = "-", mods = "CTRL", action = act.DecreaseFontSize },
    { key = "0", mods = "CTRL", action = act.ResetFontSize },
  }
end
