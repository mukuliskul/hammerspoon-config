hs.loadSpoon("SpoonInstall")

-- Install AppLauncher
spoon.SpoonInstall:andUse("AppLauncher", {
	hotkeys = {
		c = "Calendar",
		d = "Discord",
		f = "Firefox Developer Edition",
		n = "Notes",
		p = "1Password 7",
		r = "Reeder",
		t = "Kitty",
		z = "Zoom.us",
	},
})
