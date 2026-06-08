--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- see hyprctl clients

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	name = "thunar",
	match = { class = "(t|T)hunar" },
	opacity = 0.8,
	float = true,
})

hl.window_rule({
	name = "xdg portal",
	match = { class = "xdg-desktop-portal-gtk" },
	opacity = 0.8,
	float = true,
})

hl.window_rule({
	name = "keepassxc",
	match = { class = "(org.keepassxc.KeePassXC|cake_wallet)" },
	float = true,
})

hl.window_rule({
	name = "browser",
	match = { class = "(Mullvad Browser|Tor Browser)" },
	float = true,
})

hl.window_rule({
	name = "media",
	match = { class = "(org.gnome.Loupe|mpv)" },
	float = true,
})

hl.window_rule({
	name = "virt manager",
	match = { class = ".virt-manager-wrapped" },
	float = true,
})

hl.window_rule({
	name = "tools",
	match = { class = "(GoldenDict-ng|net.lutris.Lutris|org.qbittorrent.qBittorrent)" },
	float = true,
})

hl.window_rule({
	name = "pip",
	match = { title = "^(Picture-in-Picture)$" },
	opacity = 1.0,
	float = true,
})

hl.window_rule({
	name = "fullscreen",
	match = { fullscreen = true },
	opacity = 1.0,
})

-- DMS windows floating by default
-- ! Hyprland doesn't size these windows correctly so disabling by default here
hl.window_rule({
	name = "quickshell",
	match = { class = "^(org.quickshell)$" },
	float = true,
})
-- # layerrule = no_anim on, match:namespace ^(quickshell)$
-- # layerrule = no_anim on, match:namespace ^dms:.*

-- # windowrule = tile, match:class ^(pavucontrol)$
-- # windowrule = tile, match:class ^(nm-connection-editor)$
-- windowrulev2 = float, class:^(xdg-desktop-portal)$
--
-- # windowrule = no_initial_focus on, match:class ^(steam)$, match:title ^(notificationtoasts)
-- # windowrule = pin, match:class ^(steam)$, match:title ^(notificationtoasts)
