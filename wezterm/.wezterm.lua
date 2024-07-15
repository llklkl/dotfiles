local wezterm = require("wezterm")
local act = wezterm.action
local is_windows = wezterm.target_triple == "x86_64-pc-windows-msvc"

-- 启动菜单
local launch = {}

if is_windows then
	table.insert(launch, {
		label = "git bash",
		args = { "C:/Program Files/Git/bin/bash.exe", "-i", "-l" },
	})
end

-- 按键绑定
local leader_key = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }
local keys = {
	-- ctrl+shift+alt+h 水平分屏
	{ key = "h", mods = "CTRL|SHIFT|ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	-- ctrl+shift+alt+v 垂直分屏
	{ key = "v", mods = "CTRL|SHIFT|ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	-- alt+方向键切换分屏
	{ key = "UpArrow", mods = "ALT", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "ALT", action = act.ActivatePaneDirection("Down") },
	{ key = "LeftArrow", mods = "ALT", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "ALT", action = act.ActivatePaneDirection("Right") },

	{ key = "w", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
}
local key_tables = {
	resize_pane = {
		{ key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
	},
}

return {
	default_prog = { "C:/Program Files/Git/bin/bash.exe", "-i", "-l" },

	-- 禁用bell
	audible_bell = "Disabled",
	-- 启动菜单
	launch_menu = launch,

	-- 主题
	color_scheme = "Everforest Dark (Gogh)",
	-- 背景透明度
	window_background_opacity = 0.95,

	-- 滚动条
	enable_scroll_bar = false,

	-- 窗口设置
	window_decorations = "INTEGRATED_BUTTONS|RESIZE",
	window_close_confirmation = "AlwaysPrompt",
	initial_cols = 120,
	initial_rows = 35,

	-- 按键绑定
	disable_default_key_bindings = true,
	leader = leader_key,
	keys = keys,
	key_tables = key_tables,
}
