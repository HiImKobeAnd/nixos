local apps = require(default_applications)
local M = {}

function M.setup(hl)
	local mainMod = "SUPER" -- Sets "Windows" key as main modifier
	----------------------
	---- APPLICATIONS ----
	----------------------

	hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(apps.terminal))
	hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(apps.browser))
	hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(apps.notes))
	hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(apps.mail))
	hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("anki"))
	hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("zotero"))

	-----------------
	---- DESKTOP ----
	-----------------

	hl.bind(mainMod, hl.dsp.exec_cmd("$ipc launcher toggle"))
	hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("$ipc sessionMenu toggle"))
	hl.bind(mainMod .. " + Q", hl.dsp.window.close())
	hl.bind(mainMod .. " + Y", hl.dsp.window.float({ action = "toggle" }))
	hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

	--------------------
	---- MULTIMEDIA ----
	--------------------

	hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("$ipc volume increase"), { locked = true, repeating = true })
	hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("$ipc volume decrease"), { locked = true, repeating = true })
	hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
	hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
	hl.bind("XF86AudioNext + Shift", hl.dsp.exec_cmd("playerctl previous"))

	--------------------
	---- WORKSPACES ----
	--------------------

	-- Switch workspaces with mainMod + [0-9]
	-- Move active window to a workspace with mainMod + SHIFT + [0-9]
	for i = 1, 10 do
		local key = i % 10 -- 10 maps to key 0
		hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
		hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
	end

	-- Example special workspace (scratchpad)
	hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
	hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

	-- Scroll through existing workspaces with mainMod + scroll
	hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
	hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

	-----------------
	---- WINDOWS ----
	-----------------

	-- Move focus with mainMod + arrow keys
	hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
	hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
	hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
	hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

	-- Move window with mainMod + shift + arrow keys
	hl.bind(mainMod .. " + Shift + left", hl.dsp.focus({ direction = "left" }))
	hl.bind(mainMod .. " + Shift + right", hl.dsp.focus({ direction = "right" }))
	hl.bind(mainMod .. " + Shift + up", hl.dsp.focus({ direction = "up" }))
	hl.bind(mainMod .. " + Shift + down", hl.dsp.focus({ direction = "down" }))

	-- Move window to next/prev workspace with mainMod + ctrl + shift + arrow keys
	hl.bind(mainMod .. " + Ctrl + Shift + up", hl.dsp.window.move({ workspace = "e-1" }))
	hl.bind(mainMod .. " + Ctrl + Shift + down", hl.dsp.focus({ workspace = "e+1" }))

	-- Move/resize windows with mainMod + LMB/RMB and dragging
	hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
	hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

	--------------
	---- MISC ----
	--------------

	hl.bind("F23", hl.dsp.pass({ window = "class:^(discord)" }))
	hl.bind("F24", hl.dsp.pass({ window = "class:^(discord)" }))
	hl.bind("mouse:282", hl.dsp.pass({ window = "class:^(discord)" }))
	hl.bind("Print", hl.dsp.exec_cmd("grim -g '$(slurp -d)' - | wl-copy"))
	hl.bind("Ctrl + Print", hl.dsp.exec_cmd("grim -g '$(slurp)' - | wl-copy"))
	hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("$ipc brightness increase"), { locked = true, repeating = true })
	hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("$ipc brightness decrease"), { locked = true, repeating = true })

	hl.bind("$mainMod", "Space", "", function()
		local handle = io.popen("hyprctl activewindow -j")
		local result = handle:read("*a")
		handle:close()

		if result and result:find('"title": "Super Productivity"') then
			os.execute("hyprctl dispatch togglespecialworkspace magic")
		else
			os.execute("hyprctl dispatch togglespecialworkspace magic")
			os.execute('hyprctl dispatch focuswindow "title:^(Super Productivity)$"')
			os.execute('hyprctl dispatch pass "title:^(Super Productivity)$"')
		end
	end)
end

return M
