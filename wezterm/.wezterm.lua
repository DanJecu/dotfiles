local wezterm = require("wezterm")
local act = wezterm.action

local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end
-- Settings
config.default_cursor_style = "BlinkingBar"
config.color_scheme = "Dark+"
-- config.font = wezterm.font({ family = "Bitstream Vera Sans Mono", weight = "Regular" })
-- config.font = wezterm.font({ family = "SF Mono" })
config.font = wezterm.font({ family = "IBM Plex Mono" })
-- config.font = wezterm.font({ family = "CommitMono" })
config.font_size = 15.2
config.line_height = 1.4
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
	{ key = "[", mods = "LEADER", action = act.ActivateTabRelative(0) },
	{ key = "]", mods = "LEADER", action = act.ActivateTabRelative(2) },
	{ key = "t", mods = "LEADER", action = act.ShowTabNavigator },
	-- Key table for moving tabs around
	{ key = "m", mods = "LEADER", action = act.ActivateKeyTable({ name = "move_tab", one_shot = false }) },

	-- Lastly, workspace
	{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
}
-- I can use the tab navigator (LDR t), but I also want to quickly navigate tabs with index
for i = 2, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 2),
	})
end

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
	-- CTRL+ALT + number to move to that position
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL|ALT",
		action = wezterm.action.MoveTab(i - 1),
	})
end
-- Tab bar
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.status_update_interval = 1000

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

wezterm.on("update-right-status", function(window, pane)
	-- Workspace name
	local stat = window:active_workspace()
	-- It's a little silly to have workspace name all the time
	-- Utilize this to display LDR or current key table name
	if window:active_key_table() then
		stat = window:active_key_table()
	end
	if window:leader_is_active() then
		stat = "LDR"
	end

	-- Current working directory
	local basename = function(s)
		-- Nothign a little regex can't fix
		return string.gsub(s, "(.*[/\\])(.*)", "%2")
	end
	local cwd = basename(pane:get_current_working_dir())
	-- Current command
	local cmd = basename(pane:get_foreground_process_name())

	-- Time
	local time = wezterm.strftime("%H:%M")

	-- Let's add color to one of the components
	window:set_right_status(wezterm.format({
		-- Wezterm has a built-in nerd fonts
		{ Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
		{ Text = " | " },
		{ Foreground = { Color = "FFB86C" } },
		{ Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
		"ResetAttributes",
		{ Text = " | " },
		{ Text = wezterm.nerdfonts.md_clock .. "  " .. time },
		{ Text = " |" },
	}))
end)

return config
