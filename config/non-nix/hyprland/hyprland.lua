require("animations")
require("keybinds")
local apps = require("default_applications")

---- MONITORS ----

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

---- AUTOSTART ----

hl.on("hyprland.start", function()
	hl.exec_cmd("noctalia-shell")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hyprctl plugin load $HY3_PATH")
	hl.exec_cmd(apps.music, { workspace = "1 silent" })
	hl.exec_cmd(apps.communication, { workspace = "1 silent" })
	hl.exec_cmd(apps.browser, { workspace = "2 silent" })
	hl.exec_cmd(apps.planning, { workspace = "special:magic silent" })
	hl.exec_cmd(apps.notes, { workspace = "special:magic silent" })
end)

---- ENVIRONMENT VARIABLES ----

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

---- LOOK AND FEEL ----

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		layout = "hy3",
		gaps_in = 0,
		gaps_out = 1,
		border_size = 1,

		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
	},

	animations = {
		enabled = true,
	},
})

-- hl.config({
-- 	hy3 = {},
-- })

----  MISC  ----

hl.config({
	misc = {
		force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
	},
})

---- INPUT ----

hl.config({
	input = {
		kb_layout = "dk",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		follow_mouse = 1,

		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

		touchpad = {
			natural_scroll = false,
		},
	},
})

---- WINDOWS AND WORKSPACES ----

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
suppressMaximizeRule:set_enabled(false)

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

for i = 1, 4 do
	hl.workspace_rule({
		workspace = i,
		persistent = true,
	})
end

-- LibreWolf Picture-in-Picture Rule
hl.window_rule({
	match = {
		title = "^(Picture-in-Picture)$",
		class = "^(librewolf)$",
	},
	float = true,
	pin = true,
	size = { 480, 270 },
	move = { "100%-820", "100%-470" },
	keep_aspect_ratio = true,
})
