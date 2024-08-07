-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.neovide then
  -- vim.o.guifont = "Hack Nerd Font:h10"
  vim.o.guifont = "Inconsolata LGC Nerd Font:h10.5"
  vim.g.neovide_scroll_animation_length = 0.2
  vim.g.neovide_cursor_animation_length = 0.1
  vim.g.neovide_cursor_trail_size = 0.8
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_cursor_unfocused_outline_width = 0.125
  vim.g.neovide_cursor_smooth_blink = false
  vim.g.neovide_cursor_vfx_mode = "pixiedust" -- railgun, torpedo, pixiedust, sonicboom, ripple, wireframe,
  vim.g.neovide_cursor_vfx_opacity = 200.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
  vim.g.neovide_cursor_vfx_particle_density = 7.0
  vim.g.neovide_cursor_vfx_particle_speed = 10.0
  vim.g.neovide_cursor_vfx_particle_phase = 1.5
  vim.g.neovide_cursor_vfx_particle_curl = 1.0
  vim.g.neovide_hide_mouse_when_typing = false
  vim.g.neovide_theme = "auto"
  vim.g.neovide_remember_window_size = true
end
