-- wombat (matching the vim colorscheme), awesome3 theme, by zhuravlik
-- #eb4034  - czerwień

--{{{ Main
local awful = require("awful")
awful.util = require("awful.util")

theme = {}

home = os.getenv("HOME")
config = awful.util.getdir("config")
shared = "/usr/share/awesome"
if not awful.util.file_readable(shared .. "/icons/awesome16.png") then
	shared = "/usr/share/local/awesome"
end
sharedicons = shared .. "/icons"
sharedthemes = shared .. "/themes"
themes = config .. "/themes"
themename = "/wombat"
if not awful.util.file_readable(themes .. themename .. "/theme.lua") then
	themes = sharedthemes
end
themedir = themes .. themename

-- wallpaper1    = "/home/peter/Pictures/pexels-white-mountains-2.jpeg"
--wallpaper1    = "/home/peter/Pictures/climber_silhouette_mountains_130488_1920x1200.jpg"
--wallpaper2    = themedir .. "/background.png"
--wallpaper3    = sharedthemes .. "/zenburn/zenburn-background.png"
--wallpaper4    = sharedthemes .. "/default/background.png"
--wpscript      = home .. "/.wallpaper"

--if awful.util.file_readable(wallpaper1) then
--theme.wallpaper = wallpaper1
--elseif awful.util.file_readable(wallpaper2) then
--theme.wallpaper = wallpaper2
--elseif awful.util.file_readable(wpscript) then
--theme.wallpaper_cmd = { "sh " .. wpscript }
--elseif awful.util.file_readable(wallpaper3) then
--theme.wallpaper = wallpaper3
--else
--theme.wallpaper = wallpaper4
--end
--}}}

-- {{{ Styles
theme.font = "Terminus 14"
-- theme.font = "JetBrains Mono 9"
--theme.font = "Terminess Nerd Font Propo 9"
-- theme.font = "Ubuntu Mono Nerd Font 10"
-- theme.font      = "Hack Nerd Font Propo 10"

-- {{{ Colors
theme.fg_normal = "#333333"
-- theme.bg_normal = "#16181c"
theme.bg_normal = "#000000"
theme.fg_focus = "#8d8a4b"
theme.bg_focus = "#16181c"
theme.fg_urgent = "#929392"
theme.bg_urgent = "#343534"
-- }}}

-- {{{ Borders
theme.border_width = "1"
theme.useless_gap = "5"
theme.border_normal = "#333333"
theme.border_focus = "#555555"
theme.border_marked = "#CC9393"
--theme.border_width  = "2"
--theme.border_normal = "#34353488"
--theme.border_normal = "#2d4113"
--theme.border_normal = "#586c2d"
--theme.border_focus  = "#a2bf36"
--theme.border_focus  = "#6886c1"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus = "#333333"
theme.titlebar_bg_normal = "#333333"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Tasklist
theme.tasklist_fg_focus = "#8288a1" -- kolor komunikatu używanego właśnie programu
theme.tasklist_bg_focus = "#000000"
theme.tasklist_disable_icon = true
-- }}}

-- {{{ Prompt theming
theme.prompt_fg = "#fcba03"
theme.prompt_bg = "#000000"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#000000"
--theme.bg_end_widget    = "#000000"
--theme.beautiful.bg_systray = "000000"
--theme.wibox.widget.systray_opacity = 1
--theme.border_widget    = "#3F3F3F"
-- theme.wibar_bg = "#16181c"
theme.wibar_bg = "#000000"
theme.wibar_fg = "#8288a1" -- kolor tekstu w barze za wyjątkiem tasklist_fg_focus i taglist_fg_focus
theme.wibar_opacity = 1
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

-- {{{ Menu
-- Variables set fog theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = "15"
theme.menu_width = "130"
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel = sharedthemes .. "/zenburn/taglist/squarefz.png"
theme.taglist_squares_unsel = sharedthemes .. "/zenburn/taglist/squarez.png"
theme.taglist_font = "Terminus 12"
theme.taglist_fg = "#111111"
theme.taglist_fg_focus = "#cccccc"
theme.taglist_bg_focus = "#014d73"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon = themedir .. "/awesome-icon.png"
theme.menu_submenu_icon = sharedthemes .. "/default/submenu.png"
theme.tasklist_floating_icon = sharedthemes .. "/default/tasklist/floatingw.png"
-- }}}

-- {{{ Layout
theme.layout_tile = themedir .. "/layouts/tile.png"
theme.layout_tileleft = themedir .. "/layouts/tileleft.png"
theme.layout_tilebottom = themedir .. "/layouts/tilebottom.png"
theme.layout_tiletop = themedir .. "/layouts/tiletop.png"
theme.layout_fairv = themedir .. "/layouts/fairv.png"
theme.layout_fairh = themedir .. "/layouts/fairh.png"
theme.layout_spiral = themedir .. "/layouts/spiral.png"
theme.layout_dwindle = themedir .. "/layouts/dwindle.png"
theme.layout_max = themedir .. "/layouts/max.png"
theme.layout_fullscreen = themedir .. "/layouts/fullscreen.png"
theme.layout_magnifier = themedir .. "/layouts/magnifier.png"
theme.layout_floating = themedir .. "/layouts/floating.png"
theme.layout_cornernw = themedir .. "/layouts/cornernw.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus = sharedthemes .. "/wombat-2/titlebar/close_focus.png"
theme.titlebar_close_button_normal = sharedthemes .. "/wombat-2/titlebar/close_normal.png"

theme.titlebar_ontop_button_focus_active = sharedthemes .. "/wombat-2/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = sharedthemes .. "/wombat-2/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive = sharedthemes .. "/wombat-2/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = sharedthemes .. "/wombat-2/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active = sharedthemes .. "/wombat-2/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = sharedthemes .. "/wombat-2/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive = sharedthemes .. "/wombat-2/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = sharedthemes .. "/wombat-2/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active = sharedthemes .. "/wombat-2/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = sharedthemes .. "/wombat-2/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive = sharedthemes .. "/wombat-2/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = sharedthemes .. "/wombat-2/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active = sharedthemes .. "/wombat-2/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = sharedthemes .. "/wombat-2/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive = sharedthemes .. "/wombat-2/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = sharedthemes .. "/wombat-2/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme
