# ~/.config/qutebrowser/config.py

config.load_autoconfig()

config.set("auto_save.session", True)
# Enable dark mode
config.set("colors.webpage.darkmode.enabled", True)
config.set("colors.webpage.darkmode.policy.page", "always")
config.set("colors.webpage.darkmode.policy.images", "never")
config.set("colors.webpage.preferred_color_scheme", "dark")
# config.set("colors.webpage.darkmode.algorithm", "lightness-hsl")
# config.set("colors.webpage.darkmode.contrast", -0.01)
config.set("colors.webpage.darkmode.threshold.foreground", 40)

# config.set("content.user_stylesheets", ["~/.config/qutebrowser/custom.css"])


# Toggle darkmode
config.bind(
    "<Alt+Shift+d>", "config-cycle -p colors.webpage.darkmode.enabled True False"
)


# Toggle javascript for webpages
config.bind("<Alt+Shift+j>", "config-cycle -p content.javascript.enabled False True")
