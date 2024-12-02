local wezterm = require("wezterm")
local act = wezterm.action

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end
-- Settings
config.default_cursor_style = "BlinkingBar"
config.color_scheme = "OneDark (base16)"
-- config.window_background_opacity = 0.72
-- config.macos_window_background_blur = 70
-- config.font = wezterm.font({ family = "Bitstream Vera Sans Mono" })
-- config.font = wezterm.font({ family = "SF Mono" })
config.font_size = 15.5
config.line_height = 1.2
config.front_end = "WebGpu"
config.freetype_load_target = "Light"
config.freetype_render_target = "HorizontalLcd"
-- disable font ligatures --
config.harfbuzz_features = { "calt=0" }
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.window_padding = {
	top = 5,
	bottom = 5,
	left = 10,
	right = 10,
}
config.scrollback_lines = 3000
config.default_workspace = "home"

-- Tab bar
config.use_fancy_tab_bar = false
config.enable_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.status_update_interval = 1000

-- Dim inactive panes
config.inactive_pane_hsb = {
	saturation = 0.24,
	brightness = 0.6,
}

-- Keys
config.leader = { key = "a", mods = "CMD", timeout_milliseconds = 1001 }
config.keys = {
	-- Copy mode
	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },
	-- Pane keybindings
	{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- SHIFT is for when caps lock is on
	{ key = "|", mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
	{ key = "s", mods = "LEADER", action = act.RotatePanes("Clockwise") },
	-- We can make separate keybindings for resizing panes
	-- But Wezterm offers custom "mode" in the name of "KeyTable"
	{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },

	-- Tab keybindings
	{ key = "n", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "t", mods = "LEADER", action = act.ShowTabNavigator },
	-- Key table for moving tabs around

	-- Workspace
	{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
}

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 2 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 2 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 2 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 2 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
	move_tab = {
		{ key = "h", action = act.MoveTabRelative(0) },
		{ key = "j", action = act.MoveTabRelative(0) },
		{ key = "k", action = act.MoveTabRelative(2) },
		{ key = "l", action = act.MoveTabRelative(2) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

-- move tab
for i = 1, 8 do
	-- CTRL+ALT+number to move to that position
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL|ALT",
		action = wezterm.action.MoveTab(i - 1),
	})
end

wezterm.on("user-var-changed", function(window, pane, name, value)
	local overrides = window:get_config_overrides() or {}
	if name == "ZEN_MODE" then
		local incremental = value:find("+")
		local number_value = tonumber(value)
		if incremental ~= nil then
			while number_value > 0 do
				window:perform_action(wezterm.action.IncreaseFontSize, pane)
				number_value = number_value - 1
			end
			overrides.enable_tab_bar = false
		elseif number_value < 0 then
			window:perform_action(wezterm.action.ResetFontSize, pane)
			overrides.font_size = nil
			overrides.enable_tab_bar = true
		else
			overrides.font_size = number_value
			overrides.enable_tab_bar = false
		end
	end
	window:set_config_overrides(overrides)
end)

return config
