local M = {}

M.dark_color_scheme = "catppuccin-frappe"
M.light_color_scheme = "catppuccin-latte"

local function file_exists(path)
  local f = io.open(path, "r")
  if f then
    f:close()
  end
  return f ~= nil
end

local function set_neovide_bg()
  if (not vim.g.neovide) and (not os.getenv("KITTY_WINDOW_ID")) then
    return
  end

  local xdg_config = vim.env.XDG_CONFIG_HOME or vim.env.HOME .. "/.config"
  local kitty_theme_conf_path = xdg_config .. "/kitty/themes/theme.conf"
  if not file_exists(kitty_theme_conf_path) then
    return
  end
  local file = io.open(kitty_theme_conf_path, "r")
  if file == nil then
    return
  end
  local bg_color = nil
  local fg_color = nil
  for line in file:lines() do
    if line:match("^%s*background%s+") then
      bg_color = line:match("#%x+")
    elseif line:match("^%s*foreground%s+") then
      fg_color = line:match("#%x+")
    end
  end
  vim.cmd("hi Normal guibg=" .. bg_color)
  -- vim.cmd("hi Normal guifg=" .. fg_color)
end

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

  if dark == nil then
    vim.cmd("colorscheme " .. M.dark_color_scheme)
    set_neovide_bg()
  end

  if dark ~= vim.g.dark then
    if vim.g.dark ~= nil then
      vim.notify("Change colorscheme to " .. target_colors_name)
    end
    vim.g.dark = dark

    vim.cmd("colorscheme " .. target_colors_name)
    set_neovide_bg()
  end

  vim.defer_fn(function()
    M.set_color_scheme_from_system()
  end, 2000)
end

set_neovide_bg()
return M
