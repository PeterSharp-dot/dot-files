# ~/.config/qutebrowser/config.py

config.load_autoconfig()

config.set("auto_save.session", True)
# Enable dark mode
config.set("colors.webpage.darkmode.enabled", True)
config.set("colors.webpage.darkmode.policy.page", "always")
config.set("colors.webpage.darkmode.policy.images", "never")
config.set("colors.webpage.preferred_color_scheme", "dark")

# Function to toggle dark mode
# def toggle_dark_mode():
#     enabled = c.colors.webpage.darkmode.enabled
#     new_value = not enabled
#     c.colors.webpage.darkmode.enabled = new_value
#     message = "Dark mode enabled" if new_value else "Dark mode disabled"
#     message = f"set colors.webpage.darkmode.enabled {new_value}"
#     config.set("colors.webpage.darkmode.enabled", new_value)
#     print(message)

# Toggle darkmode
config.bind('<Alt+Shift+d>', 'config-cycle -p colors.webpage.darkmode.enabled True False')


# Toggle javascript for webpages
config.bind('<Alt+Shift+j>', 'config-cycle -p content.javascript.enabled False True')
