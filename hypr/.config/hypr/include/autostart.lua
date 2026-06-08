-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

hl.on("hyprland.start", function()
	hl.exec_cmd("bash ~/.dotfiles/scripts/startup_hyprland.sh")
	hl.exec_cmd("brightnessctl set 25%")
	hl.exec_cmd("bash ~/.dotfiles/scripts/startup.sh")
	hl.exec_cmd("systemctl start --user polkit-gnome-authentication-agent-1")
	hl.exec_cmd("mpd")
	hl.exec_cmd("mpDris2")
	hl.exec_cmd("pypr")
	-- ibus-daemon -drx
	hl.exec_cmd("fcitx5 -d -r")
	hl.exec_cmd("dms run")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- hl.env("XCURSOR_SIZE", "24")
-- hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("QT_QPA_PLATFORMTHEME", "gtk3")
hl.env("QT_QPA_PLATFORMTHEME_QT6", "gtk3")
hl.env("TERMINAL", "kitty")
