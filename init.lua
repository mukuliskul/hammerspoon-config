hs.loadSpoon("SpoonInstall")

-- Install AppLauncher
spoon.SpoonInstall:andUse("AppLauncher", {
	hotkeys = {
		b = "Beekeeper Studio",
		d = "Docker Desktop",
		g = "ChatGPT",
		k = "Slack",
		l = "Linear",
		n = "Obsidian",
		o = "Microsoft Outlook",
		p = "Bruno",
		s = "Spotify",
		t = "WezTerm",
		w = "Whatsapp",
		x = "Google Chrome",
	},
})

-- Install WindowHalfsAndThirds
spoon.SpoonInstall:andUse("WindowHalfsAndThirds", {
	hotkeys = {
		left_half = { { "ctrl", "cmd" }, "Left" },
		right_half = { { "ctrl", "cmd" }, "Right" },
		top_half = { { "ctrl", "cmd" }, "Up" },
		bottom_half = { { "ctrl", "cmd" }, "Down" },
		third_left = { { "ctrl", "alt" }, "Left" },
		third_right = { { "ctrl", "alt" }, "Right" },
		third_up = { { "ctrl", "alt" }, "Up" },
		third_down = { { "ctrl", "alt" }, "Down" },
		top_left = { { "ctrl", "cmd" }, "1" },
		top_right = { { "ctrl", "cmd" }, "2" },
		bottom_left = { { "ctrl", "cmd" }, "3" },
		bottom_right = { { "ctrl", "cmd" }, "4" },
		max_toggle = { { "ctrl", "alt", "cmd" }, "f" },
		max = { { "ctrl", "alt", "cmd" }, "Up" },
		undo = { { "alt", "cmd" }, "z" },
		center = { { "alt", "cmd" }, "c" },
		larger = { { "alt", "cmd", "shift" }, "Right" },
		smaller = { { "alt", "cmd", "shift" }, "Left" },
	},
})

-- Install ClipboardTool
spoon.SpoonInstall:andUse("ClipboardTool", {
	start = true,
	config = {
		show_copied_alert = false,
		paste_on_select = true,
	},
	hotkeys = {
		toggle_clipboard = { { "ctrl", "alt" }, "c" },
	},
})

-- Install ArrangeDesktop
spoon.SpoonInstall:andUse("ArrangeDesktop", {
	fn = function(spoon)
		spoon.arrangements = spoon:_loadConfiguration()
		if spoon.arrangements["office"] then
			spoon:arrange("office")
		else
			print("Arrangement 'office' not found.")
		end
	end,
})
