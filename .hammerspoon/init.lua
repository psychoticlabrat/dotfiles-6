require('console').init()

-- for simpler binding of keys, define the modifiers ahead of time. 
local hyper = {"cmd","alt","ctrl","shift"}
local meh = {"alt","ctrl","shift"}
local csft = {"ctrl", "shift"}
local mash = {"shift", "cmd"}



local alertStyle= {radius=10,textFont="Avenir", textSize=20, strokeWidth=3,strokeColor=hs.drawing.color.x11.palevioletred}
-- itunes

hs.hotkey.bind(csft, 'd', function()
	hs.itunes.playpause()
end) 
hs.hotkey.bind(csft, 's', function()
	hs.itunes.previous()
end) 

hs.hotkey.bind(csft, 'f', function()
	hs.itunes.next()
end) 
hs.hotkey.bind(csft, ";", function()
	hs.itunes.volumeUp()
	hs.alert.closeAll()
	hs.alert.show("Music Volume: " .. hs.itunes.getVolume(),alertStyle)
end) 
hs.hotkey.bind(csft, '/', function()
	hs.itunes.volumeDown()
	hs.alert.closeAll()
	hs.alert.show("Music Volume:" .. hs.itunes.getVolume(), alertStyle)
end) 

-- This is broken in Big Sur/M1 Mac
-- Swap computers with monitor's kvm switch.
-- hs.hotkey.bind(meh, 'm', function() 
-- 	-- eject external volumes before swapping 
-- 	hs.execute('osascript -e \'tell application \"Finder\" to eject (every disk whose ejectable is true)\'')
-- 	hs.alert('ejecting volumes...')
-- 	hs.timer.doAfter(1, function()
-- 	local binary = os.getenv("HOME") .. "/.ddcctl/ddcctl"
-- 	local input = 17
-- 	hs.execute(binary .. " -d 1 -i " .. input)
-- end) end)

hs.hotkey.bind(hyper, "r", hs.toggleConsole)

-- Window Management
-- Specific applications
hs.hotkey.bind(hyper, "d", function()
	hs.application.launchOrFocusByBundleID("com.hnc.Discord")
	-- hs.application.launchOrFocusByBundleID("com.Discord_U")
end)
hs.hotkey.bind(hyper, "t", function()
	--hs.application.launchOrFocusByBundleID("net.kovidgoyal.kitty")
--	hs.application.launchOrFocusByBundleID("io.Alacritty")
	hs.application.launchOrFocusByBundleID("com.googlecode.iterm2")
end)
hs.hotkey.bind(hyper, "m", function()
	hs.application.launchOrFocusByBundleID("com.apple.Music")
end)
hs.hotkey.bind(hyper, "s", function()
	hs.application.launchOrFocusByBundleID("com.apple.Safari")
end)
-- hs.hotkey.bind(hyper, "e", function()
-- 	hs.application.launchOrFocusByBundleID("org.gnu.Emacs")
-- end)
hs.hotkey.bind(hyper, "f", function()
	hs.application.launchOrFocusByBundleID("org.mozilla.firefox")
end)
hs.hotkey.bind(hyper, "b", function()
	hs.application.launchOrFocusByBundleID("com.brave.Browser")
end)

-- hinting
-- hs.hotkey.bind({"ctrl"}, "f", function()
--     hs.hints.hintChars= {'a','s','d','f','g','h','j','k','l'}
--     hs.hints.windowHints(hs.window.allWindows())
--     end)

-- local wf = hs.window.filter

-- grid size determines how the windows can be split into a grid
-- laid out evenly onto the desktop
gridSize = '8x8'
gridMargins = '10x10'

-- set the dimensions. If  you need to cover two different
-- grid sizes you'll have to set them locally inside the 
-- window management functions 
-- grid margins defines spacing on x and y between windows and the menu 
-- bar/monitor edges 0x0 if you want no space between windows.
hs.grid.setGrid(gridSize)
hs.grid.setMargins(gridMargins)

-- reduce the animation of moving the window to 0.0seconds
-- you can add animation time if you like watching your windows
-- whizz around the screen. This gets old really quick, though.
hs.window.animationDuration=0.0
-- setting it to false, although this is false by default. It will
-- prevent window wiggling before setting into place which is
-- annoying
hs.window.setFrameCorrectness =false
hs.hotkey.bind(hyper, "h", function()
	-- hs.alert(hs.window.frontmostWindow().windowsToWest())
	-- hs.alert(hs.window.frontmostWindow().windowsToWest())
	local win = hs.window.frontmostWindow()
	win.focusWindowWest()
end)

hs.hotkey.bind(hyper, "j", function()
	local win = hs.window.frontmostWindow()
	win.focusWindowSouth() 
end)

hs.hotkey.bind(hyper, "k", function()
	hs.window.frontmostWindow().focusWindowNorth()
end)
hs.hotkey.bind(hyper, "l", function()
	hs.window.frontmostWindow().focusWindowEast()
end)

-- hs.hotkey.bind(hyper, 'u', function()
--     hs.window.focusedWindow():focusTab(1)
-- end)


-- hs.hotkey.bind("cmd","left", function()
-- 	setWindow(4,8,0,0)
-- end)

-- hs.hotkey.bind("cmd","right", function()
-- 	setWindow(4,8,4,0)
-- end)


hs.hotkey.bind(meh, "m", function()
	hs.grid.setGrid('6x1')
	setWindow(4,1,0,0)
	hs.grid.setGrid(gridSize)
end)
hs.hotkey.bind(meh, ".", function()
	hs.grid.setGrid('6x1')
	setWindow(4,1,2,0)
	hs.grid.setGrid(gridSize)
end)
hs.hotkey.bind(meh, ",", function()
	hs.grid.setGrid('6x1')
	setWindow(4,1,1,0)
	hs.grid.setGrid(gridSize)
end)

hs.hotkey.bind(meh, "u", function()
	hs.grid.setGrid('3x1')
	setWindow(1,1,0,0)
	hs.grid.setGrid(gridSize)
end)

hs.hotkey.bind(meh, "i", function()
	hs.grid.setGrid('3x1')
	setWindow(1,1,1,0)
	hs.grid.setGrid(gridSize)
end)

hs.hotkey.bind(meh, "o", function()
	hs.grid.setGrid('3x1')
	setWindow(1,1,2,0)
	hs.grid.setGrid(gridSize)
end)
-- hs.hotkey.bind(meh, "k", function()
-- 	setWindow(4,8,2,0)
-- end)
hs.hotkey.bind(meh, "h", function()
	setWindow(2,8,0,0)
end)

hs.hotkey.bind(meh, "l", function()
	setWindow(2,8,6,0)
end)

toggle = 0
hs.hotkey.bind(meh, "f", function()
	setWindow(8,8,0,0)
	-- local win = hs.window.focusedWind
	win:toggleFullScreen()
end)
-- create a 1440p window center screen
current=0
hs.hotkey.bind(meh, "j", function()
	if current == 0 then
		centerAndResize(2560,1440)
		current = 1
	elseif current == 1 then 
		centerAndResize(1920,1080)
		current = 2
	elseif current == 2 then
		setWindow(4,8,2,0)
		current = 0 
	end
end)
current2=0
hs.hotkey.bind(meh, "k", function()
	if current2 == 0 then
		setWindow(4,8,2,0)
		current2 = 1
	elseif current2 == 1 then 
		setWindow(4,4,2,0)
		current2 = 2
	elseif current2 == 2 then
		setWindow(4,4,2,4)
		current2 = 0 
	end
end)

hs.hotkey.bind(meh, "n", hs.grid.pushWindowNextScreen)
hs.hotkey.bind(meh, "p", hs.grid.pushWindowPrevScreen)

-- local chooser = hs.chooser.new(function(choice)
-- 		if not choice then return end
-- 		if choice["text"] == "1080p" then hs.alert(choice["text"])
-- 		centerAndResize(1920,1080)
-- 		elseif choice["text"] == "1440p" then hs.alert(choice["text"])
-- 		centerAndResize(2560,1440)
-- 		elseif choice["text"] == "Big Center" then hs.alert(choice["text"])
-- 		setWindow(4,8,2,0)
-- 		end
-- 		end)

-- 	chooser:rows(5)
-- 	chooser:width(22)
-- 	chooser:placeholderText("Move Window")
-- 	chooser:searchSubText(true)
-- 	chooser:choices({
-- 			{
-- 			["text"] = "1080p",
-- 			["subText"] = "set window to 1080p and center",
-- 			["image"] = hs.image.imageFromPath('/Users/least/.hammerspoon/images/1080p.png')
-- 			},
-- 			{
-- 			["text"] = "1440p",
-- 			["subText"] = "set window to 1440p and center",
-- 			["image"] = hs.image.imageFromPath('/Users/least/.hammerspoon/images/1440p.png')
-- 			},
-- 			{
-- 			["text"] = "Big Center",
-- 			["image"] = hs.image.imageFromPath('/Users/least/.hammerspoon/images/BigCenter.png')
-- 			},

-- 			})
-- hs.hotkey.bind(hyper, 'm', function() chooser:show() end)


function centerAndResize(w,h)
	if hs.window.focusedWindow() then
		local win = hs.window.frontmostWindow()
		local id= win:id()
		local screen = win:screen()
		win:centerOnScreen()
		win:setSize({0,0,w,h})
		win:centerOnScreen()
	end
end


function setWindow(w,h,x,y)
	if hs.window.focusedWindow() then
		local win = hs.window.frontmostWindow()
		local id = win:id()
		local screen = win:screen()
		cell = hs.grid.get(win, screen)
		cell.w = w
		cell.h = h
		cell.x = x
		cell.y = y
		hs.grid.set(win, cell, screen)
	end
end

function applicationWatcher(appName, eventType, appObject)
	if (eventType == hs.application.watcher.activated) then
		if (appName == "Finder") then
			-- Bring all Finder windows forward when one gets activated
			appObject:selectMenuItem({"Window", "Bring All to Front"})
		end
	end
end
appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()


-- TODO: create a function to swap a window with the one to the left and to the right. If it is at the edge, swap with opposite side window.
-- TODO: create 1/3 layouts


-- window swapper
-- local movewindows = hs.hotkey.modal.new()
--[[
prevWindow = hs.window.focusedWindow()
hs.hotkey.bind(hyper, 'space', function() 

	local switcher = hs.chooser.new(function(choice) 
		if not choice then return end
		hs.application.launchOrFocusByBundleID(choice.id)
	end)

	local windows = hs.fnutils.map(hs.window.filter.new():getWindows(), function(win)


		if win ~= hs.window.focusedWindow() then
			return {
				text = win:title(),
				subText = win:application():title(),
				image = hs.image.imageFromAppBundle(win:application():bundleID()),
				id = win:application():bundleID()
			}
		end
	end)


	switcher
		:query(nil)
		:placeholderText('Switch to...')
		:width(22)
		:searchSubText(true)
		:choices(windows)
		:show()
	end)
--]]
--
--
function move(dir)
    local counter = {
        right = 0,
        left = 0
    }
    return function()
        counter[dir] = _move(dir, counter[dir])
    end
end

function _move(dir, ct)
    local screenWidth = hs.screen.mainScreen():frame().w
    local focusedWindowFrame = hs.window.focusedWindow():frame()
    local x = focusedWindowFrame.x
    local w = focusedWindowFrame.w
    local value = dir == 'right' and x + w or x
    local valueTarget = dir == 'right' and screenWidth or 0
    if value ~= valueTarget then
        hs.window.focusedWindow():moveToUnit(hs.layout[dir .. 50])
        return 50
    elseif ct == 50 then
        hs.window.focusedWindow():moveToUnit(hs.layout[dir .. 70])
        return 70
    elseif ct == 70 then
        hs.window.focusedWindow():moveToUnit(hs.layout[dir .. 30])
        return 30
    else
        hs.window.focusedWindow():moveToUnit(hs.layout[dir .. 50])
        return 50
    end
end

--- window
hs.window.animationDuration = 0
hs.hotkey.bind({"ctrl", "cmd"}, "l", move('right'))
hs.hotkey.bind({"ctrl", "cmd"}, "h", move('left'))

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded", alertStyle)


