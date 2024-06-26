/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int gappx     = 5;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int swallowfloating    = 0;        /* 1 means swallow floating windows by default */
static const int showbar            = 0;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
//static const char *fonts[]          = { "monospace:size=10" };
//static const char *fonts[]          = { "FantasqueSansMono Nerd Font:size=11" };
static const char *fonts[]          = { "Inconsolata Nerd Font:size=12" };
static const char dmenufont[]       = "Inconsolata Nerd Font:size=12";
static const char col_gray1[]       = "#ffffff";    //background color
static const char col_gray2[]       = "#eeeeee";    //inactive window border color
static const char col_gray3[]       = "#000000";    //font color
static const char col_gray4[]       = "#000000";    //current tag and current window font
static const char col_cyan[]        = "#dddddd";    //active tag number box and win border
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, "#eeeeee" },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
	[SchemeStatus]  = { col_gray3, col_gray1,  "#eeeeee"  }, // Statusbar right {text,background,not used but cannot be empty}
	[SchemeTagsSel]  = { col_gray4, col_cyan,  "#eeeeee"  }, // Tagbar left selected {text,background,not used but cannot be empty}
    [SchemeTagsNorm]  = { col_gray3, col_gray1,  "#eeeeee"  }, // Tagbar left unselected {text,background,not used but cannot be empty}
    [SchemeInfoSel]  = { col_gray4, col_gray1,  "#eeeeee"  }, // infobar middle  selected {text,background,not used but cannot be empty}
    [SchemeInfoNorm]  = { col_gray3, col_gray1,  "#eeeeee"  }, // infobar middle  unselected {text,background,not used but cannot be empty}
};


/* tagging */
static const char *tags[] = { " ", "2", "3", "4", "5", "6", "7", "8", "9" };
static const char *defaulttagapps[] = { "firefox", "Alacritty", "termite", NULL, NULL, NULL, NULL, NULL, NULL };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance title  tags mask isfloating  isterminal  noswallow  monitor  float x,y,w,h     floatborderpx*/
//	{ "Firefox",  NULL,    NULL,  1 << 8,   0,          0,     	-1,	   -1 },
	{ "Gimp",     NULL,    NULL,  0,        0,  	    0,          -1,	   -1 },
	{ "Firefox",  NULL,    NULL,  0,	1,	    0,          -1,	   -1,      30,275,1450,900,  1 },
	{ "Termite",  NULL,    NULL,  0,	1,	    1,          0,	   -1,      30,275,1450,900,  1 },
	{ "Alacritty",NULL,    NULL,  0,	1,	    1,          0,	   -1,      30,275,1450,900,  1 },
	{ "XTerm",    NULL,    NULL,  0,	1,	    1,          0,	   -1,      30,275,900,900,   1 },
	{ "Display",  NULL,    NULL,  0,	1,	    1,          1,	   -1,      30,275,1450,900,  1 },
	{ "st",       NULL,    NULL,  0,	1,	    1,          1,	   -1,      30,275,1450,900,  1 },
	{ "Zathura",  NULL,    NULL,  0,	1,	    1,          1,	   -1,      25,30,900,1175,   1 },
	{ "Sxiv",     NULL,    NULL,  0,	1,	    1,          1,	   -1,      30,275,1450,900,  1 },
	{ "Pcmanfm",  NULL,    NULL,  0,	1,	    1,          1,	   -1,      30,275,1450,900,  1 },
};

/* layout(s) */
static const float mfact     = 0.60; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

#include "layouts.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[T]",      tile },    /* first entry is default */
	{ "[F]",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
	{ "HHH",      grid },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmdst[]  = { "st", NULL };
static const char *termcmd[]  = { "alacritty", NULL };
static const char *termcmdblack[]  = { "alacritty", "--config-file", "/home/peter/.config/alacritty/b_alacritty.yml", NULL };
//static const char *termcmdgruv[]  = { "termite", "-c", "/home/peter/.config/termite/black-config", NULL };
//static const char *browser[]  = { "firefox", NULL };
static const char *soundplus[]  = { "/home/peter/.local/bin/volup", NULL };
static const char *soundminus[]  = { "/home/peter/.local/bin/voldown", NULL };
static const char *sleepcmd[]  = { "/home/peter/.local/bin/sleep.sh", NULL };
static const char *watchcmd[]  = { "notify-watch", NULL };

#include "selfrestart.c"
#include "movestack.c"

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_s,      spawn,          {.v = termcmdst } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask,             XK_s,      spawndefault,   {0} },
	{ MODKEY|ShiftMask,             XK_b,      spawn,          {.v = termcmdblack } },
//	{ MODKEY|ShiftMask,             XK_g,      spawn,          {.v = termcmdgruv } },
	{ ShiftMask,                    XK_End,    spawn,          {.v = sleepcmd } },
	{ MODKEY,                       XK_F1,     spawn,          {.v = soundminus } },
	{ MODKEY,                       XK_F2,     spawn,          {.v = soundplus } },
	{ ShiftMask,                    XK_F12,    spawn,          {.v = watchcmd } },
//	{ MODKEY|ShiftMask,             XK_w,      spawn,          {.v = browser } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_j,      movestack,      {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      movestack,      {.i = -1 } },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_a,      zoom,           {0} },
	{ MODKEY,                       XK_Escape, view,           {0} },
	{ MODKEY,                       XK_Tab,    focusstack,     {.i = +1 } },
	{ MODKEY|Mod4Mask,              XK_j,      aspectresize,   {.i = +24} },
	{ MODKEY|Mod4Mask,              XK_k,      aspectresize,   {.i = -24} },
	{ MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_g,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ Mod4Mask,                     XK_j,      moveresize,     {.v = "0x 25y 0w 0h" } },
	{ Mod4Mask,                     XK_k,      moveresize,     {.v = "0x -25y 0w 0h" } },
	{ Mod4Mask,                     XK_l,      moveresize,     {.v = "25x 0y 0w 0h" } },
	{ Mod4Mask,                     XK_h,      moveresize,     {.v = "-25x 0y 0w 0h" } },
	{ Mod4Mask|ShiftMask,           XK_j,      moveresize,     {.v = "0x 0y 0w 25h" } },
	{ Mod4Mask|ShiftMask,           XK_k,      moveresize,     {.v = "0x 0y 0w -25h" } },
	{ Mod4Mask|ShiftMask,           XK_l,      moveresize,     {.v = "0x 0y 25w 0h" } },
	{ Mod4Mask|ShiftMask,           XK_h,      moveresize,     {.v = "0x 0y -25w 0h" } },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_minus,  setgaps,        {.i = -4 } },
	{ MODKEY,                       XK_equal,  setgaps,        {.i = +4 } },
	{ MODKEY|ShiftMask,             XK_equal,  setgaps,        {.i = 0  } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
        { MODKEY,                       XK_F5,     self_restart,   {0} },
	{ MODKEY,                       XK_o,      winview,        {0} },
	{ MODKEY|ShiftMask,             XK_e,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
