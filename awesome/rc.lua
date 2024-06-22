-- If LuaRocks is installed, make sure that packages installed through it are found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")
local lain = require("lain")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors,
	})
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function(err)
		-- Make sure we don't go into an endless error loop
		if in_error then
			return
		end
		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err),
		})
		in_error = false
	end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.

-- from /usr/share/awesome/themes : anon, arch, bamboo, bio, blackburn, brown, byte, cool-blue, copland, crown, default, dk-grey, dremora, dunzor, dust, dwm, eleric, fence, fhuizing, foo, gray, green-owl, grey, grey-new, grey-old, him, holo, icons lined, matrix, multicolor, muted-dream-tree, niceandclean, obscur, pinkneon, powerarrow, powerarrow-dark, powerarrow-darker, rainbow, rbown, redhalo, roig, sky, sky-grey, smoked, snow, spektrum, steamburn, strict, sunjack, tree, vertex, vinyl, wabbit, wmii, wombat, worm, xresources, zenburn, zenburn-custom, zenburn-red

-- beautiful.init(gears.filesystem.get_themes_dir() .. "wombat-2/theme.lua")
beautiful.init("/home/peter/.config/awesome/wombat-2/theme.lua")

-- This is used later as the default terminal and editor to run.
local terminal = "alacritty"
local editor = os.getenv("EDITOR") or "nano"
local editor = os.getenv("EDITOR") or "nano"
--activ_firefox = "wmctrl -xa firefox"
--activ_emacs = "wmctrl -xa emacs"
--activ_termite = "wmctrl -xa " .. terminal
local activ_firefox = "/home/peter/.local/bin/lof /usr/lib64/firefox/firefox"
local activ_qutebrowser = "wmctrl -xa qutebrowser"
local activ_termite = "/home/peter/.local/bin/lof /usr/bin/kitty"
local go_to_zathura = "wmctrl -xa zathura"
local sleep = "/home/peter/.local/bin/sleep.sh"
local zcisz = "pactl set-sink-volume @DEFAULT_SINK@ -4000"
local zglosnij = "pactl set-sink-volume @DEFAULT_SINK@ +4000"
local mute_toggle = "pactl set-sink-mute @DEFAULT_SINK@ toggle"
local dark_terminal = "termite" .. " -c /home/peter/.config/termite/config_black"
local calculator = dark_terminal .. " -e calc"
local pcmanfm = "pcmanfm"
local awesome_config_folder = "/home/peter/.config/awesome"
local browser = "firefox"
local black_theme = "/home/peter/.local/bin/black-theme-awesome.sh"
local dracula_theme = "/home/peter/.local/bin/dracula-theme-awesome.sh"
local white_theme = "/home/peter/.local/bin/white-theme-awesome.sh"
local solarized_theme = "/home/peter/.local/bin/solarized-theme-awesome.sh"
local pulsemi = "/home/peter/.local/bin/pulsemix"
local pogoda = browser .. "  https://www.google.com/search?channel=crow5&client=firefox-b-d&q=pogoda"
local weather = "/home/peter/.local/bin/cal_pogoda.sh"
local cal = "/home/peter/.local/bin/cal.sh"
--cal = "/usr/bin/cal"
local sensors = "/home/peter/.local/bin/sensors.sh"
local calendar = browser .. " https://calendar.google.com/calendar/u/0/r?pli=1"
local mail = browser .. " https://mail.google.com/mail/u/0/#inbox"
local l_solarized_theme = "/home/peter/.local/bin/light-solarized-theme-awesome.sh"

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
local modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
	awful.layout.suit.floating,
	awful.layout.suit.tile,
	--awful.layout.suit.tile.left,
	awful.layout.suit.tile.bottom,
	--awful.layout.suit.tile.top,
	--awful.layout.suit.fair,
	--awful.layout.suit.fair.horizontal,
	--awful.layout.suit.spiral,
	--awful.layout.suit.spiral.dwindle,
	awful.layout.suit.max.fullscreen,
	awful.layout.suit.max,
	--awful.layout.suit.magnifier,
	--awful.layout.suit.corner.nw,
	-- awful.layout.suit.corner.ne,
	-- awful.layout.suit.corner.sw,
	-- awful.layout.suit.corner.se,
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
local myawesomemenu = {
	{
		"hotkeys",
		function()
			hotkeys_popup.show_help(nil, awful.screen.focused())
		end,
	},
	{ "manual", terminal .. " -e man awesome" },
	--{ "edit config", editor_cmd .. " " .. awesome.conffile },
	{ "restart", awesome.restart },
	{
		"quit",
		function()
			awesome.quit()
		end,
	},
}

local mymainmenu = awful.menu({
	items = {
		{ "awesome", myawesomemenu, beautiful.awesome_icon },
		{ "open terminal", terminal },
	},
})

local mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon, menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
local mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
	awful.button({}, 1, function(t)
		t:view_only()
	end),
	awful.button({ modkey }, 1, function(t)
		if client.focus then
			client.focus:move_to_tag(t)
		end
	end),
	awful.button({}, 3, awful.tag.viewtoggle),
	awful.button({ modkey }, 3, function(t)
		if client.focus then
			client.focus:toggle_tag(t)
		end
	end),
	awful.button({}, 4, function(t)
		awful.tag.viewnext(t.screen)
	end),
	awful.button({}, 5, function(t)
		awful.tag.viewprev(t.screen)
	end)
)

local tasklist_buttons = gears.table.join(
	awful.button({}, 1, function(c)
		if c == client.focus then
			c.minimized = true
		else
			c:emit_signal("request::activate", "tasklist", { raise = true })
		end
	end),
	awful.button({}, 3, function()
		awful.menu.client_list({ theme = { width = 250 } })
	end),
	awful.button({}, 4, function()
		awful.client.focus.byidx(1)
	end),
	awful.button({}, 5, function()
		awful.client.focus.byidx(-1)
	end)
)

local function set_wallpaper(s)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
	-- Wallpaper
	set_wallpaper(s)

	-- Each screen has its own tag table.
	awful.tag({ "1 ", "2 ", "3 ", "4 ", "5 ", "6 ", "7 ", "8 ", "9 " }, s, awful.layout.layouts[2])

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contain an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(gears.table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist({
		screen = s,
		--filter  = awful.widget.taglist.filter.all,
		filter = function(t)
			return t.selected or #t:clients() > 0
		end,
		buttons = taglist_buttons,
	})

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist({
		screen = s,
		--filter  = awful.widget.tasklist.filter.currenttags,
		filter = awful.widget.tasklist.filter.focused,
		--buttons = tasklist_buttons
	})

	-- Create the wibox
	s.mywibox = awful.wibar({ position = "bottom", height = 22, screen = s })

	-- my widgets
	mytextclock = wibox.widget.textclock("%a %b %d, %H:%M:%S  ", 1)
	mytextclock:buttons(gears.table.join(
		mytextclock:buttons(),
		awful.button({}, 1, nil, function()
			local new_shape = function(cr, width, height)
				gears.shape.rounded_rect(cr, width, height, 5)
			end
			beautiful.notification_shape = new_shape
			awful.spawn(cal)
			--naughty.notify({title="Calendar", text=cal,})
			beautiful.notification_bg = "#222222"
			beautiful.notification_fg = "#aaaaaa"
			--beautiful.notification_border_width = "3"
			--beautiful.notification_border_color = "#eeeeee"
		end)
	))

	volumewidget, volume_timer = awful.widget.watch("/home/peter/.local/bin/volume2", 60)
	volumewidget:buttons(gears.table.join(
		volumewidget:buttons(),
		awful.button({}, 3, nil, function()
			awful.spawn(pulsemi)
		end)
	))
	volumewidget:buttons(gears.table.join(
		volumewidget:buttons(),
		awful.button({}, 2, nil, function()
			awful.spawn(mute_toggle)
		end)
	))

	--local volume_container = wibox.widget{
	--volumewidget,
	--align = "center",
	--valign = "center",
	--layout = wibox.container.place,
	--}

	--volume_container:connect_signal("button::press", function()
	--awful.spawn(pulsemi)
	--end)

	myweatherwidget, weather_timer =
		awful.widget.watch('curl wttr.in/51.250559,22.5701022?format="%c+%p+%t+%w+%P"', 240)
	myweatherwidget:buttons(gears.table.join(
		myweatherwidget:buttons(),
		awful.button({}, 3, nil, function()
			awful.spawn(pogoda)
		end)
	))
	myweatherwidget:buttons(gears.table.join(
		myweatherwidget:buttons(),
		awful.button({}, 1, nil, function()
			weather_timer:emit_signal("timeout")
			awful.spawn(weather)
			local new_shape = function(cr, width, height)
				gears.shape.rounded_rect(cr, width, height, 5)
			end
			beautiful.notification_shape = new_shape
			beautiful.notification_opacity = 1
			beautiful.notification_bg = "#222222"
			beautiful.notification_fg = "#aaaaaa"
			beautiful.notification_max_width = 1850
			beautiful.notification_max_height = 1200
		end)
	))

	myseperatorwidget = wibox.widget.textbox("  ")
	mycpuwidget = awful.widget.watch("/home/peter/.local/bin/cpu", 2)
	mymemorywidget = awful.widget.watch("/home/peter/.local/bin/mem", 60)

	mytempwidget = awful.widget.watch("/home/peter/.local/bin/temp", 60)
	mytempwidget:buttons(gears.table.join(
		mytempwidget:buttons(),
		awful.button({}, 1, nil, function()
			awful.spawn(sensors)
			local new_shape = function(cr, width, height)
				gears.shape.rounded_rect(cr, width, height, 5)
			end
			beautiful.notification_shape = new_shape
			beautiful.notification_bg = "#222222"
			beautiful.notification_fg = "#aaaaaa"
		end)
	))

	-- LOGO
	logo_widget = wibox.widget.textbox("  ")
	logo_widget.font = "Font Awesome 11" -- Możesz dostosować czcionkę i rozmiar

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			--mylauncher,
			logo_widget,
			myseperatorwidget,
			s.mytaglist,
			s.mypromptbox,
			myseperatorwidget,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			--mykeyboardlayout,
			--wibox.widget.systray(),
			myweatherwidget,
			myseperatorwidget,
			mycpuwidget,
			myseperatorwidget,
			mymemorywidget,
			myseperatorwidget,
			mytempwidget,
			myseperatorwidget,
			volumewidget,
			myseperatorwidget,
			mytextclock,
			s.mylayoutbox,
		},
	})
end)
-- }}}

-- {{{ Mouse bindings
root.buttons(gears.table.join(
	awful.button({}, 3, function()
		mymainmenu:toggle()
	end),
	awful.button({}, 4, awful.tag.viewnext),
	awful.button({}, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = gears.table.join(
	awful.key({ modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
	--    awful.key({ modkey,           }, "Left",   awful.tag.viewprev,
	--              {description = "view previous", group = "tag"}),
	--    awful.key({ modkey,           }, "Right",  awful.tag.viewnext,
	--              {description = "view next", group = "tag"}),
	awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),

	-- Show/Hide Wibox
	awful.key({ modkey }, "b", function()
		for s in screen do
			s.mywibox.visible = not s.mywibox.visible
			if s.mybottomwibox then
				s.mybottomwibox.visible = not s.mybottomwibox.visible
			end
		end
	end, { description = "toggle wibox", group = "awesome" }),

	awful.key({}, "F8", function()
		mymainmenu:show()
	end, { description = "show main menu", group = "awesome" }),

	awful.key({ modkey }, "Return", function()
		if client.focus == awful.client.getmaster() then
			awful.client.swap.byidx(1)
			awful.client.focus.byidx(-1)
		else
			awful.client.setmaster(client.focus)
		end
	end, { description = "swap with next client with master", group = "client" }),

	awful.key({ modkey }, "`", function()
		if client.focus == awful.client.getmaster() then
			awful.client.swap.byidx(1)
			awful.client.focus.byidx(-1)
		else
			awful.client.setmaster(client.focus)
		end
	end, { description = "swap with next client with master", group = "client" }),

	awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),

	awful.key({ modkey }, "Tab", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, { description = "go back", group = "client" }),

	-- Standard programs
	awful.key({ modkey, "Shift" }, "Return", function()
		awful.spawn(terminal)
	end, { description = "open a terminal", group = "launcher" }),
	--awful.key({ modkey, "Shift"   }, "Return", function () awful.spawn(dark_terminal) end,
	--{description = "open a dark terminal", group = "launcher"}),
	awful.key({ modkey, "Shift" }, "w", function()
		awful.spawn(white_theme)
	end, { description = "open white theme", group = "themes" }),
	awful.key({ modkey, "Shift" }, "b", function()
		awful.spawn(black_theme)
	end, { description = "open black theme", group = "themes" }),
	awful.key({ modkey, "Shift" }, "d", function()
		awful.spawn(dracula_theme)
	end, { description = "open dracula theme", group = "themes" }),
	awful.key({ modkey, "Shift" }, "s", function()
		awful.spawn(solarized_theme)
	end, { description = "open solarized theme", group = "themes" }),
	awful.key({ modkey, "Shift" }, "x", function()
		awful.spawn(l_solarized_theme)
	end, { description = "open light solarized theme", group = "themes" }),
	awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "e", awesome.quit, { description = "quit awesome", group = "awesome" }),
	awful.key({ modkey, "Control" }, "d", function()
		awful.spawn.with_shell(sleep)
	end, { description = "suspend", group = "control" }),
	awful.key({ modkey }, "End", function()
		awful.spawn.with_shell(sleep)
	end, { description = "suspend", group = "control" }),
	awful.key({ modkey }, "w", function()
		awful.spawn(activ_firefox)
	end, { description = "activate firefox", group = "programs" }),
	awful.key({ modkey }, "q", function()
		awful.spawn(activ_qutebrowser)
	end, { description = "activate qutebrowser", group = "programs" }),
	awful.key({ modkey }, "z", function()
		awful.spawn(go_to_zathura)
	end, { description = "activate zathura", group = "programs" }),
	awful.key({ modkey }, "F5", function()
		awful.spawn(mail)
	end, { description = "show gmail", group = "programs" }),
	--awful.key({                   }, "F7", function () awful.spawn(activ_emacs) end,
	--{description = "activate emacs", group = "programs"}),
	awful.key({ modkey }, "a", function()
		awful.spawn(activ_termite)
	end, { description = "activate terminal", group = "programs" }),
	awful.key({ modkey }, "F12", function()
		awful.spawn(calendar)
	end, { description = "show google calendar", group = "programs" }),
	awful.key({ modkey }, "F1", function()
		awful.spawn(zcisz)
		volume_timer:emit_signal("timeout")
	end, { description = "quieter", group = "control" }),
	awful.key({ modkey }, "F2", function()
		awful.spawn(zglosnij)
		volume_timer:emit_signal("timeout")
	end, { description = "louder", group = "control" }),
	awful.key({ modkey }, "F3", function()
		awful.spawn(mute_toggle)
		volume_timer:emit_signal("timeout")
	end, { description = "mute", group = "control" }),
	awful.key({ modkey }, ";", function()
		awful.spawn(calculator)
	end, { description = "calculator", group = "programs" }),
	awful.key({ modkey }, "/", function()
		awful.spawn(pcmanfm)
	end, { description = "pcmanfm", group = "programs" }),

	--awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)          end,
	--{description = "increase master width factor", group = "layout"}),
	--awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)          end,
	--{description = "decrease master width factor", group = "layout"}),
	--awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1, nil, true) end,
	--{description = "increase the number of master clients", group = "layout"}),
	--awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1, nil, true) end,
	--{description = "decrease the number of master clients", group = "layout"}),

	--awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
	--{description = "increase the number of columns", group = "layout"}),
	--awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
	--{description = "decrease the number of columns", group = "layout"}),
	awful.key({ modkey }, "space", function()
		awful.layout.inc(1)
	end, { description = "select next layout", group = "layout" }),
	awful.key({ modkey, "Shift" }, "space", function()
		awful.layout.inc(-1)
	end, { description = "select previous layout", group = "layout" }),

	awful.key({ modkey, "Control" }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			c:emit_signal("request::activate", "key.unminimize", { raise = true })
		end
	end, { description = "restore minimized", group = "client" }),
	-- Prompt utilities
	--awful.key({ modkey },            "p",     function () awful.screen.focused().mypromptbox:run() end,
	--{description = "run prompt", group = "launcher"}),

	awful.key({ modkey }, "x", function()
		awful.prompt.run({
			prompt = "Run Lua code: ",
			textbox = awful.screen.focused().mypromptbox.widget,
			exe_callback = awful.util.eval,
			history_path = awful.util.get_cache_dir() .. "/history_eval",
		})
	end, { description = "lua execute prompt", group = "awesome" }),
	-- Menubar
	--awful.key({ modkey }, "d", function() menubar.show() end,   --{description = "show the menubar", group = "launcher"}),

	awful.key({ modkey }, "p", function()
		awful.util.spawn("dmenu_run -nf black -nb white -p '>' ")
	end, { description = "open dmenu", group = "launcher" }),
	-- Useless gaps on the fly
	awful.key({ modkey }, "=", function()
		lain.util.useless_gaps_resize(1)
	end, { description = "increment useless gaps", group = "tag" }),
	awful.key({ modkey }, "-", function()
		lain.util.useless_gaps_resize(-1)
	end, { description = "decrement useless gaps", group = "tag" })
)

clientkeys = gears.table.join(
	awful.key({ modkey }, "k", function(c)
		if c.floating then
			c:relative_move(0, -20, 0, 0)
		else
			--awful.client.incwfact(0.025)
			awful.client.focus.byidx(-1)
		end
	end, { description = "Floating Resize Vertical -", group = "client" }),
	awful.key({ modkey }, "j", function(c)
		if c.floating then
			c:relative_move(0, 20, 0, 0)
		else
			--awful.client.incwfact(-0.025)
			awful.client.focus.byidx(1)
		end
	end, { description = "Floating Resize Vertical +", group = "client" }),
	awful.key({ modkey }, "h", function(c)
		if c.floating then
			c:relative_move(-20, 0, 0, 0)
		else
			awful.tag.incmwfact(-0.025)
		end
	end, { description = "Floating Resize Horizontal -", group = "client" }),
	awful.key({ modkey }, "l", function(c)
		if c.floating then
			c:relative_move(20, 0, 0, 0)
		else
			awful.tag.incmwfact(0.025)
		end
	end, { description = "Floating Resize Horizontal +", group = "client" }),
	awful.key({ modkey, "Shift" }, "j", function(c)
		if c.floating then
			c:relative_move(0, 0, 0, 20)
		else
			awful.client.swap.byidx(1)
		end
	end, { description = "Floating Move Down", group = "client" }),
	awful.key({ modkey, "Shift" }, "k", function(c)
		if c.floating then
			c:relative_move(0, 0, 0, -20)
		else
			awful.client.swap.byidx(-1)
		end
	end, { description = "Floating Move Up", group = "client" }),
	awful.key({ modkey, "Shift" }, "h", function(c)
		if c.floating then
			c:relative_move(0, 0, -20, 0)
		else
			awful.client.swap.byidx(-1)
		end
	end, { description = "Floating Move Left", group = "client" }),
	awful.key({ modkey, "Shift" }, "l", function(c)
		if c.floating then
			c:relative_move(0, 0, 20, 0)
		else
			awful.client.swap.byidx(1)
		end
	end, { description = "Floating Move Right", group = "client" }),

	awful.key({ modkey }, "f", function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, { description = "toggle fullscreen", group = "client" }),
	awful.key({ modkey, "Shift" }, "q", function(c)
		c:kill()
	end, { description = "close", group = "client" }),
	awful.key(
		{ modkey, "Control" },
		"space",
		awful.client.floating.toggle,
		{ description = "toggle floating", group = "client" }
	),

	-- Resize vertically more
	awful.key({ modkey, "Control" }, "k", function(c)
		if c.floating then
			c:relative_move(0, 0, 0, -20)
		else
			awful.client.incwfact(0.025)
		end
	end, { description = "Floating Resize Vertical -", group = "client" }),

	-- Resize vertically less
	awful.key({ modkey, "Control" }, "j", function(c)
		if c.floating then
			c:relative_move(0, 0, 0, 20)
		else
			awful.client.incwfact(-0.025)
		end
	end, { description = "Floating Resize Vertical +", group = "client" }),

	awful.key({ modkey, "Control" }, "Return", function(c)
		c:swap(awful.client.getmaster())
	end, { description = "move to master", group = "client" }),
	--awful.key({ modkey,           }, "o",      function (c) c:move_to_screen()               end,
	--{description = "move to screen", group = "client"}),
	awful.key({ modkey }, "t", function(c)
		c.ontop = not c.ontop
	end, { description = "toggle keep on top", group = "client" }),

	awful.key({ modkey }, "n", function(c)
		-- The client currently has the input focus, so it cannot be
		-- minimized, since minimized clients can't have the focus.
		c.minimized = true
	end, { description = "minimize", group = "client" }),

	awful.key({ modkey }, "m", function(c)
		c.maximized = not c.maximized
		c:raise()
	end, { description = "(un)maximize", group = "client" }),

	awful.key({ modkey, "Shift" }, "m", function(c)
		c.maximized_vertical = not c.maximized_vertical
		c:raise()
	end, { description = "(un)maximize vertically", group = "client" }),

	awful.key({ modkey, "Control" }, "m", function(c)
		c.maximized_horizontal = not c.maximized_horizontal
		c:raise()
	end, { description = "(un)maximize horizontally", group = "client" }),

	awful.key({}, "F6", function(c)
		c.floating = not c.floating
		c.width = c.screen.geometry.width * 5 / 7
		--c.x = c.screen.geometry.x+(c.screen.geometry.width/33)
		c.x = 0
		--c.height = c.screen.geometry.height * 0.75
		c.height = 900
		-- c.y = c.screen.geometry.height * 0.20
		c.y = 154
	end, { description = "precise floating window", group = "client" }),

	awful.key({ modkey }, "y", function(c)
		c.floating = not c.floating
		c.width = 750
		c.height = 530
		c.x = 0
		c.y = 524
	end, { description = "terminal size window", group = "client" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = gears.table.join(
		globalkeys,
		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "view tag #" .. i, group = "tag" }),
		-- Toggle tag display.
		awful.key({ modkey, "Control" }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, { description = "toggle tag #" .. i, group = "tag" }),
		-- Move client to tag.
		awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, { description = "move focused client to tag #" .. i, group = "tag" }),
		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, { description = "toggle focused client on tag #" .. i, group = "tag" })
	)
end

clientbuttons = gears.table.join(
	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	awful.button({ modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end),
	awful.button({ modkey }, 2, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end)
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	},

	-- Floating clients.
	{
		rule_any = {
			instance = {
				"DTA", -- Firefox addon DownThemAll.
				"copyq", -- Includes session name in class.
				"pinentry",
				"pcmanfm",
				"mplayer",
				"MPlayer",
				"Mplayer",
				"mpv",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"display",
				"Display",
				"Gpick",
				"Kruler",
				"MessageWin", -- kalarm.
				"Sxiv",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
				"Wpa_gui",
				"veromix",
				"mplayer",
				"MPlayer",
				"Mplayer",
				"mpv",
				"xtightvncviewer",
			},

			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"AlarmWindow", -- Thunderbird's calendar.
				"ConfigManager", -- Thunderbird's about:config.
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			},
		},
		properties = { floating = true },
	},

	-- Add titlebars to normal clients and dialogs
	{ rule_any = { type = { "normal", "dialog" } }, properties = { titlebars_enabled = false } },

	-- Set Firefox to always map on the tag named "2" on screen 1.
	-- { rule = { class = "Firefox" },
	--   properties = { screen = 1, tag = "2" } },

	{ rule = { instance = "pcmanfm --desktop" }, properties = { tag = "8" } },
	{ rule = { instance = "pcmanfm" }, properties = { tag = "8" } },
	{
		rule = { name = "pulsemixer" },
		properties = { floating = true },
		callback = function(c)
			awful.client.relative_move(0, 0, 100, 100)
		end,
	},
	{
		rule = { class = "Termite" },
		properties = { floating = true },
		callback = function(c)
			x, y, w, h = awful.client.geometry(c)
			awful.client.relative_move(c.x, c.y + 130, c.w + 100, c.h + 100)
		end,
	},
}

--}

-- }}}

-- {{{ Signals

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
	-- Set the windows at the slave,
	-- i.e. put it at the end of others instead of setting it master.
	-- if not awesome.startup then awful.client.setslave(c) end

	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
	-- buttons for the titlebar
	local buttons = gears.table.join(
		awful.button({}, 1, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.move(c)
		end),
		awful.button({}, 3, function()
			c:emit_signal("request::activate", "titlebar", { raise = true })
			awful.mouse.client.resize(c)
		end)
	)

	-- awful.titlebar(c, {size = 22, bg_normal = '#ffffff', bg_focus = '#ffffff', fg_normal = '#ffffff'}) : setup {

	awful
		.titlebar(c, { size = 22, bg_normal = "#333333", bg_focus = "#333333", fg_normal = "#0b0b0b", fg_focus = "#ffffff" })
		:setup({
			{ -- Left
				awful.titlebar.widget.iconwidget(c),
				buttons = buttons,
				layout = wibox.layout.fixed.horizontal,
			},
			{ -- Middle
				{ -- Title
					align = "center",
					widget = awful.titlebar.widget.titlewidget(c),
				},
				buttons = buttons,
				layout = wibox.layout.flex.horizontal,
			},
			{ -- Right
				awful.titlebar.widget.floatingbutton(c),
				awful.titlebar.widget.maximizedbutton(c),
				awful.titlebar.widget.stickybutton(c),
				awful.titlebar.widget.ontopbutton(c),
				awful.titlebar.widget.closebutton(c),
				layout = wibox.layout.fixed.horizontal(),
			},
			layout = wibox.layout.align.horizontal,
		})
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c)
	c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
	c.border_color = beautiful.border_normal
end)
-- }}}

awful.spawn.with_shell("~/.config/awesome/autorun.sh")

-- window swallow
--function is_terminal(c)
--    return (c.class and c.class:match("term")) and true or false
--end
--
--function copy_size(c, parent_client)
--    if not c or not parent_client then
--        return
--    end
--    if not c.valid or not parent_client.valid then
--        return
--    end
--    c.x=parent_client.x;
--    c.y=parent_client.y;
--    c.width=parent_client.width;
--    c.height=parent_client.height;
--end
--function check_resize_client(c)
--    if(c.child_resize) then
--        copy_size(c.child_resize, c)
--    end
--end
--
--client.connect_signal("property::size", check_resize_client)
--client.connect_signal("property::position", check_resize_client)
--
--client.connect_signal("manage", function(c)
--    if is_terminal(c) then
--        return
--    end
--
--    local parent_client=awful.client.focus.history.get(c.screen, 1)
--
--    awful.spawn.easy_async('bash '..awesome_config_folder..'helper.sh gppid '..c.pid, function(gppid)
--        awful.spawn.easy_async('bash '..awesome_config_folder..'helper.sh ppid '..c.pid, function(ppid)
--            if parent_client and (gppid:find('^' .. parent_client.pid) or ppid:find('^' .. parent_client.pid))and is_terminal(parent_client) then
--                parent_client.child_resize=c
--                parent_client.minimized = true
--
--                c:connect_signal("unmanage", function() parent_client.minimized = false end)
--
--                -- c.floating=true
--                copy_size(c, parent_client)
--            end
--        end)
--    end)
--end)

-- Notifications configuration
naughty.config.defaults.timeout = 12
naughty.config.presets.low.timeout = 12
beautiful.notification_bg = "#000000"
beautiful.notification_fg = "#aaaaaa"
beautiful.notification_border_width = 5
--beautiful.notification_border_color = "#367beb"
beautiful.notification_border_color = "#777777"
local new_shape = function(cr, width, height)
	gears.shape.rounded_rect(cr, width, height, 5)
end
beautiful.notification_shape = new_shape
beautiful.notification_opacity = 0.9
beautiful.notification_margin = 5
beautiful.notification_icon_size = 120
beautiful.notification_max_width = 400
beautiful.notification_max_height = 150
