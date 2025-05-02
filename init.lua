hs.loadSpoon("SpoonInstall")

-- Install AppLauncher
spoon.SpoonInstall:andUse("AppLauncher", {
	hotkeys = {
		g = "ChatGPT",
		k = "Slack",
		l = "Linear",
		o = "Outlook",
		t = "WezTerm",
		x = "Google Chrome",
	},
})
