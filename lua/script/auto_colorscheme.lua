local M = {}

M.dark_color_scheme = "tokyonight-moon"
M.light_color_scheme = "catppuccin-latte"

M.set_color_scheme_from_system = function()
  local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme")
  if not handle then
    return
  end

  local result = handle:read("*a")
  handle:close()
  local target_colors_name = vim.g.colors_name
  local dark = vim.g.dark

  if result:match("dark") then
    target_colors_name = M.dark_color_scheme
    dark = true
  elseif result:match("light") or result:match("default") then
    target_colors_name = M.light_color_scheme
    dark = false
  else
    target_colors_name = M.dark_color_scheme
    dark = true
  end

  if dark ~= vim.g.dark then
    if vim.g.dark ~= nil then
      vim.notify("Change colorscheme to " .. target_colors_name)
    end
    vim.g.dark = dark

    vim.cmd("colorscheme " .. target_colors_name)
  end

  vim.defer_fn(function()
    M.set_color_scheme_from_system()
  end, 2000)
end

return M
