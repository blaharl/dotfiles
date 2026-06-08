---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"
local terminal = "kitty"
local fileManager = "thunar"
local dic = "dms ipc call "
local dsp = hl.dsp

hl.bind(mainMod .. " + T", dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + C", dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + Q", dsp.window.close())
closeWindowBind:set_enabled(true)

hl.bind(mainMod .. " + space", dsp.exec_cmd(dic .. "spotlight toggle"))
hl.bind("ALT + SHIFT + L", dsp.exec_cmd(dic .. "lock lock"))
hl.bind(mainMod .. " + CTRL + V", dsp.exec_cmd(dic .. "clipboard toggle"))
hl.bind(mainMod .. " + M", dsp.exec_cmd(dic .. "processlist focusOrToggle")) -- TODO: float
hl.bind(mainMod .. " + comma", dsp.exec_cmd(dic .. "settings focusOrToggle"))
hl.bind(mainMod .. " + SHIFT + O", dsp.exec_cmd(dic .. "notifications toggle"))
hl.bind(mainMod .. " + O", dsp.exec_cmd(dic .. "notepad toggle"))
hl.bind(mainMod .. " + Y", dsp.exec_cmd(dic .. "dankdash wallpaper"))
hl.bind(mainMod .. " + TAB", dsp.exec_cmd(dic .. "hypr toggleOverview"))
hl.bind(mainMod .. " + X", dsp.exec_cmd(dic .. "powermenu toggle"))
hl.bind(mainMod .. " + SHIFT + Slash", dsp.exec_cmd(dic .. "keybinds toggle hyprland"))

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(
	mainMod .. " + SHIFT + Q",
	dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'dsp.exit()'")
)
hl.bind(mainMod .. " + E", dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", dsp.window.float({ action = "toggle" }))
-- TODO: fullscreen mode
hl.bind(mainMod .. " + F", dsp.window.fullscreen())
hl.bind(mainMod .. " + P", dsp.window.pseudo())
hl.bind(mainMod .. " + SHIFT + P", dsp.layout("togglesplit")) -- dwindle only
-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + H", dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + left", dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", dsp.focus({ direction = "down" }))
-- hl.bind(mainMod .. " + Home", dsp.focus({ direction = "first" }))
-- hl.bind(mainMod .. " + End", dsp.focus({ direction = "last" }))
hl.bind(mainMod .. " + N", dsp.window.cycle_next())
-- TODO: cycle prev
-- hl.bind(mainMod .. " + SHIFT + Tab", dsp.window.cycle_next())

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + CTRL + mouse_down", dsp.window.move({ workspace = "e+1" }))
hl.bind(mainMod .. " + CTRL + mouse_up", dsp.window.move({ workspace = "e-1" }))
--
-- -- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", dsp.window.resize(), { mouse = true })
-- Laptop multimedia keys for volume and LCD brightness

-- amixer set Master 5%+, 5%-, toggle
-- dic audio increment 5, decrement 3, mute, micmute
hl.bind(
	"ALT + SHIFT + S",
	dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"ALT + SHIFT + A",
	dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"ALT + SHIFT + D",
	dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"ALT + SHIFT + F",
	dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)

hl.bind(
	"XF86AudioRaiseVolume",
	dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioPause", dsp.exec_cmd(dic .. "mpris playPause"), { locked = true, repeating = true })
hl.bind("XF86AudioPlay", dsp.exec_cmd(dic .. "mpris playPause"), { locked = true, repeating = true })
hl.bind("XF86AudioPrev", dsp.exec_cmd(dic .. "mpris previous"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", dsp.exec_cmd(dic .. "mpris next"), { locked = true, repeating = true })

-- brightnessctl set +5%, 5%-
-- dic brightness increment 5, decrement 5
hl.bind("XF86MonBrightnessUp", dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind("Print", dsp.exec_cmd("dms screenshot"))
hl.bind("CTRL + Print", dsp.exec_cmd("dms screenshot full"))
hl.bind("ALT + Print", dsp.exec_cmd("dms screenshot window"))

hl.bind("ALT + SHIFT + 1", dsp.exec_cmd("dms screenshot"))
hl.bind("ALT + SHIFT + 2", dsp.exec_cmd("bash ~/.dotfiles/scripts/ss.sh output"))
hl.bind("ALT + SHIFT + 3", dsp.exec_cmd("bash ~/.dotfiles/scripts/ss.sh window-edit"))
hl.bind("ALT + SHIFT + 4", dsp.exec_cmd("bash ~/.dotfiles/scripts/ss.sh region"))
hl.bind("ALT + SHIFT + 5", dsp.exec_cmd("bash ~/.dotfiles/scripts/ss.sh region-edit"))

-- # screenshot your desktop with selection
-- # grim -l 0 -g "$(slurp)" - | wl-copy

-- pyprland
hl.bind("ALT + SHIFT + Escape", dsp.exec_cmd("pypr toggle_dpms"))
hl.bind("ALT + SHIFT + Z", dsp.exec_cmd("pypr zoom"))
hl.bind("ALT + SHIFT + O", dsp.exec_cmd("pypr shift_monitors +1"))
hl.bind("ALT + SHIFT + E", dsp.exec_cmd("pypr expose"))
hl.bind("ALT + SHIFT + K", dsp.exec_cmd("pypr change_workspace +1"))
hl.bind("ALT + SHIFT + J", dsp.exec_cmd("pypr change_workspace -1"))
hl.bind("ALT + SHIFT + C", dsp.exec_cmd("pypr toggle term"))
hl.bind("ALT + SHIFT + T", dsp.exec_cmd("pypr toggle dict"))
hl.bind("ALT + SHIFT + M", dsp.exec_cmd("pypr toggle mpc"))
hl.bind("ALT + SHIFT + B", dsp.exec_cmd("pypr toggle btop"))
hl.bind("ALT + SHIFT + V", dsp.exec_cmd("pypr toggle volume"))

hl.bind(mainMod .. " + SHIFT + P", dsp.dpms())

hl.bind("ALT + SHIFT + P", dsp.exec_cmd("passmenu"))

hl.bind("SHIFT + XF86MonBrightnessDown", dsp.exec_cmd("sleep 1 && hyprctl dispatch dpms off eDP-1"))
hl.bind("SHIFT + XF86MonBrightnessUp", dsp.exec_cmd("sleep 1 && hyprctl dispatch dpms on eDP-1"))

-- # See https://wiki.hyprland.org/Configuring/Keywords/ for more
-- $mainMod = SUPER
--
-- # === Window Management ===
-- bind = $mainMod, W, togglegroup
-- bind = $mainMod SHIFT, W, exec, dms ipc call window-rules toggle
--
-- # === Column Navigation ===
-- bind = $mainMod, Home, focuswindow, first
-- bind = $mainMod, End, focuswindow, last
--
-- # === Monitor Navigation ===
-- bind = $mainMod CTRL, left, focusmonitor, l
-- bind = $mainMod CTRL, right, focusmonitor, r
-- bind = $mainMod CTRL, H, focusmonitor, l
-- bind = $mainMod CTRL, J, focusmonitor, d
-- bind = $mainMod CTRL, K, focusmonitor, u
-- bind = $mainMod CTRL, L, focusmonitor, r
--
-- # === Move to Monitor ===
-- bind = $mainMod SHIFT CTRL, left, movewindow, mon:l
-- bind = $mainMod SHIFT CTRL, down, movewindow, mon:d
-- bind = $mainMod SHIFT CTRL, up, movewindow, mon:u
-- bind = $mainMod SHIFT CTRL, right, movewindow, mon:r
-- bind = $mainMod SHIFT CTRL, H, movewindow, mon:l
-- bind = $mainMod SHIFT CTRL, J, movewindow, mon:d
-- bind = $mainMod SHIFT CTRL, K, movewindow, mon:u
-- bind = $mainMod SHIFT CTRL, L, movewindow, mon:r
--
-- # === Workspace Management ===
-- bind = CTRL SHIFT, R, exec, dms ipc call workspace-rename open
--
-- # === Move Workspaces ===
-- bind = $mainMod SHIFT, Page_Down, movetoworkspace, e+1
-- bind = $mainMod SHIFT, Page_Up, movetoworkspace, e-1
-- bind = $mainMod SHIFT, U, movetoworkspace, e+1
-- bind = $mainMod SHIFT, I, movetoworkspace, e-1
--
-- # === Column Management ===
-- bind = $mainMod, bracketleft, layoutmsg, preselect l
-- bind = $mainMod, bracketright, layoutmsg, preselect r
--
-- # === Sizing & Layout ===
-- bind = $mainMod, g, layoutmsg, togglesplit
-- bind = $mainMod CTRL, F, resizeactive, exact 100% 100%
--
-- # === Manual Sizing ===
-- binde = $mainMod, minus, resizeactive, -10% 0
-- binde = $mainMod, equal, resizeactive, 10% 0
-- binde = $mainMod SHIFT, minus, resizeactive, 0 -10%
-- binde = $mainMod SHIFT, equal, resizeactive, 0 10%
--

-- hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
-- local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- -- closeWindowBind:set_enabled(false)
-- hl.bind(
-- 	mainMod .. " + M",
-- 	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
-- )
-- hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
-- hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
-- hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
-- hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only
--
-- -- Move focus with mainMod + arrow keys
-- hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
-- hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
-- hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
-- hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
--
-- -- Switch workspaces with mainMod + [0-9]
-- -- Move active window to a workspace with mainMod + SHIFT + [0-9]
-- for i = 1, 10 do
-- 	local key = i % 10 -- 10 maps to key 0
-- 	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
-- 	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
-- end
--
-- -- Example special workspace (scratchpad)
-- hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
--
-- -- Scroll through existing workspaces with mainMod + scroll
-- hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
-- hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
--
-- -- Move/resize windows with mainMod + LMB/RMB and dragging
-- hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
-- hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
--
-- -- Laptop multimedia keys for volume and LCD brightness
-- hl.bind(
-- 	"XF86AudioRaiseVolume",
-- 	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
-- 	{ locked = true, repeating = true }
-- )
-- hl.bind(
-- 	"XF86AudioLowerVolume",
-- 	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
-- 	{ locked = true, repeating = true }
-- )
-- hl.bind(
-- 	"XF86AudioMute",
-- 	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
-- 	{ locked = true, repeating = true }
-- )
-- hl.bind(
-- 	"XF86AudioMicMute",
-- 	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
-- 	{ locked = true, repeating = true }
-- )
-- hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
-- hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
--
-- -- Requires playerctl
-- hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
-- hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
-- hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
