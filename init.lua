---@diagnostic disable: undefined-global

hs.loadSpoon("SpoonInstall")

-- Detect current mode based on WiFi network or VPN connection
local function getMode()
	local wifi = hs.wifi.currentNetwork()
	-- Add your work WiFi network names here
	local workSSIDs = {
		["MPAC-LAN"] = true,
		["YourWorkWiFi2"] = true,
	}

	if wifi and workSSIDs[wifi] then
		return "work"
	end

	local vpn = hs.execute("scutil --nc list | grep -c Connected")
	if vpn and tonumber(vpn) > 0 then
		return "work"
	end

	return "personal"
end

-- Get initial mode on startup
local currentMode = getMode()
hs.alert.show("Mode: " .. currentMode, 2)

-- App launcher configuration for each mode
local appLauncherConfig = {
	work = {
		b = "Beekeeper Studio",
		d = "Docker Desktop",
		e = "Self-Service",
		g = "ChatGPT",
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
	personal = {
		d = "Docker Desktop",
		g = "ChatGPT",
		h = "Whatsapp",
		k = "Slack",
		n = "Obsidian",
		s = "Spotify",
		w = "WezTerm",
		x = "Google Chrome",
	},
}

spoon.SpoonInstall:andUse("AppLauncher", {
	hotkeys = appLauncherConfig[currentMode],
})

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
-- Ctrl+Alt+1: Work layout (office)
hs.hotkey.bind({ "ctrl", "alt" }, "1", function()
	hs.execute('automator "/Users/sharmamu/Documents/scripts/workflow.app"')
	if spoon.ArrangeDesktop and spoon.ArrangeDesktop.arrangements and spoon.ArrangeDesktop.arrangements["office"] then
		spoon.ArrangeDesktop:arrange("office")
		hs.alert.show("Applied layout: office")
	else
		hs.alert.show("Arrangement 'office' not found")
	end
end)

-- Ctrl+Alt+2: Personal/Home layout
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

-- Check for mode changes every 5 minutes and reload app launcher if needed
-- local lastMode = currentMode
-- hs.timer.doEvery(300, function()
-- 	local newMode = getMode()
-- 	if newMode ~= lastMode then
-- 		lastMode = newMode
-- 		hs.alert.show("Mode changed to: " .. newMode, 2)
--
-- 		spoon.SpoonInstall:andUse("AppLauncher", {
-- 			hotkeys = appLauncherConfig[newMode],
-- 		})
-- 	end
-- end)
