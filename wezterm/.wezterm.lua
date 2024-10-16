local wezterm = require("wezterm")
local act = wezterm.action
local is_windows = wezterm.target_triple == "x86_64-pc-windows-msvc"

function safe_require(name)
	local success, module = pcall(require, name)
	if success then
		return module
	else
		return nil
	end
end

-- 本地特定配置
local loc = {
	-- 初始列数
	initial_cols = 120,
	-- 初始行数
	initial_rows = 35,
}
local lc = safe_require("local")
if lc then
	if lc.initial_rows then loc.initial_rows = lc.initial_rows end
	if lc.initial_cols then loc.initial_cols = lc.initial_cols end
end

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
		{ key = "DownArrow", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "UpArrow", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "q", action = "PopKeyTable" },
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
	initial_cols = loc.initial_cols,
	initial_rows = loc.initial_rows,

	-- 按键绑定
	disable_default_key_bindings = true,
	leader = leader_key,
	keys = keys,
	key_tables = key_tables,
}
