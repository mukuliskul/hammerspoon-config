---@diagnostic disable: undefined-global

hs.loadSpoon("SpoonInstall")

-- Install AppLauncher
spoon.SpoonInstall:andUse("AppLauncher", {
	hotkeys = {
		a = "Anki",
		b = "Beekeeper Studio",
		d = "Docker Desktop",
		e = "Self-Service",
		f = "FireFox",
		g = "ChatGPT",
		h = "Whatsapp",
		k = "Slack",
		l = "Linear",
		n = "Obsidian",
		m = "Notion",
		o = "Microsoft Outlook",
		p = "Bruno",
		s = "Spotify",
		t = "Microsoft Teams",
		w = "WezTerm",
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
		-- Create a new arrangement
		-- local arrangement_name = "office"
		-- spoon:createArrangement(arrangement_name)
		spoon.arrangements = spoon:_loadConfiguration()
	end,
})

-- 💡 Add hotkeys to switch layouts AFTER ArrangeDesktop is initialized
hs.hotkey.bind({ "ctrl", "alt" }, "1", function()
	hs.execute('automator "/Users/sharmamu/Desktop/workflow.app"')
	if spoon.ArrangeDesktop and spoon.ArrangeDesktop.arrangements and spoon.ArrangeDesktop.arrangements["office"] then
		spoon.ArrangeDesktop:arrange("office")
		hs.alert.show("Applied layout: office")
	else
		hs.alert.show("Arrangement 'office' not found")
	end
end)

hs.hotkey.bind({ "ctrl", "alt" }, "2", function()
	hs.execute('automator "/Users/mukul/Desktop/workflow.app"')
	if
		spoon.ArrangeDesktop
		and spoon.ArrangeDesktop.arrangements
		and spoon.ArrangeDesktop.arrangements["home-work"]
	then
		spoon.ArrangeDesktop:arrange("home-work")
		hs.alert.show("Applied layout: home-work")
	else
		hs.alert.show("Arrangement 'home-work' not found")
	end
end)
