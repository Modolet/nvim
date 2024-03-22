local M = {}

M.dark_color_scheme = "catppuccin-frappe"
M.light_color_scheme = "catppuccin-latte"

local function trim(s)
  return (s:gsub("^[%s\r\n]*(.-)[%s\r\n]*$", "%1"))
end

local function file_exists(path)
  local f = io.open(path, "r")
  if f then
    f:close()
  end
  return f ~= nil
end

local function set_neovide_bg()
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
  local handle = io.popen("gsettings get org.gnome.desktop.interface gtk-theme")
  if not handle then
    return
  end

  local result = handle:read("*a")
  handle:close()
  result = trim(result)

  if result ~= vim.g.last_theme then
    vim.g.last_theme = result
  else
    vim.defer_fn(function()
      M.set_color_scheme_from_system()
    end, 1000)
    return
  end

  local colorschemes = {
    ["'Catppuccin-Mocha'"] = "catppuccin-mocha",
    ["'Catppuccin-Latte'"] = "catppuccin-latte",
    ["'Decay-Green'"] = "decay",
    ["'Rose-Pine'"] = "rose-pine",
    ["'Tokyo-Night'"] = "tokyonight-night",
    ["'Material-Sakura'"] = "material-lighter",
    ["'Graphite-Mono'"] = "kanagawa",
    ["'Cyberpunk-Edge'"] = "silverhand",
    ["'Frosted-Glass'"] = "tokyonight-day",
    ["'Gruvbox-Retro'"] = "gruvbox",
    ["'Synth-Wave'"] = "synthwave84",
    ["'One-Dark'"] = "onedark",
  }

  local scheme = colorschemes[result]
  if scheme then
    vim.cmd("colorscheme " .. scheme)
    set_neovide_bg()
  end

  vim.defer_fn(function()
    M.set_color_scheme_from_system()
  end, 1000)
end

return M
