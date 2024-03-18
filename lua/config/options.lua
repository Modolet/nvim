local opt = vim.opt

opt.tabstop = 4
opt.expandtab = true
opt.softtabstop = 4
opt.shiftwidth = 4
opt.swapfile = false
opt.spell = false

if vim.g.neovide then
  vim.o.guifont = "CaskaydiaCove Nerd Font Mono:h14" -- text below applies for VimScript
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5
  vim.g.neovide_cursor_vfx_mode = "railgun"
  if vim.fn.has("win32") then
    -- vim.g.neovide_transparency = 0.8
    -- vim.g.neovide_window_blurred = true
  end
end
