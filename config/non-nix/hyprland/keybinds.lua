local apps = require("default_applications")

local mod = "SUPER"
local ipc = "noctalia msg "
----------------------
---- APPLICATIONS ----
----------------------

hl.bind(mod .. " + T", hl.dsp.exec_cmd(apps.terminal))
hl.bind(mod .. " + B", hl.dsp.exec_cmd(apps.browser))
hl.bind(mod .. " + O", hl.dsp.exec_cmd(apps.notes))
hl.bind(mod .. " + E", hl.dsp.exec_cmd(apps.mail))
hl.bind(mod .. " + P", hl.dsp.exec_cmd(apps.planning))
hl.bind(mod .. " + A", hl.dsp.exec_cmd("anki"))
hl.bind(mod .. " + Z", hl.dsp.exec_cmd("zotero"))

-----------------
---- DESKTOP ----
-----------------

hl.bind(mod .. " + " .. mod .. "_L", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))
hl.bind(mod .. " + Escape", hl.dsp.exec_cmd(ipc .. "panel-toggle session"))
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + Y", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen())

--------------------
---- MULTIMEDIA ----
--------------------

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"), { locked = true, repeating = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(ipc .. "media toggle"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(ipc .. "media next"))
hl.bind("SHIFT + XF86AudioNext", hl.dsp.exec_cmd(ipc .. "media previous"))

--------------------
---- WORKSPACES ----
--------------------

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))

-- Switch workspaces with mainMod + arrow keys
hl.bind(mod .. " + CTRL + up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mod .. " + CTRL + down", hl.dsp.focus({ workspace = "e+1" }))

-----------------
---- WINDOWS ----
-----------------

-- Move focus with mainMod + arrow keys
hl.bind(mod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move window with mainMod + shift + arrow keys
hl.bind(mod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Move window to next/prev workspace with mainMod + ctrl + shift + arrow keys
hl.bind(mod .. " + CTRL + SHIFT + up", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(mod .. " + CTRL + SHIFT + down", hl.dsp.window.move({ workspace = "e+1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

--------------
---- MISC ----
--------------

hl.bind("XF86TouchpadOn", hl.dsp.exec_cmd("vesktop --run-shortcut toggleMute"))
hl.bind("XF86TouchpadToggle", hl.dsp.exec_cmd("vesktop --run-shortcut toggleDeafen"))

hl.bind("mouse:282", hl.dsp.pass({ window = "class:^(discord)$" }))
hl.bind("Print", hl.dsp.exec_cmd(ipc .. "screenshot-region"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd(ipc .. "screenshot-fullscreen"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness-up"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"), { locked = true, repeating = true })

hl.bind(mod .. " + Space", hl.dsp.exec_cmd(apps.planning .. ".quick-add"))
