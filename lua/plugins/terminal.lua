local function toggle_lazygit()
  _G.lazygit:toggle()
end
local function toggle_ranger()
  _G.ranger:toggle()
end

local function toggle_horizonal_terminal()
  _G.horizonal_terminal:toggle()
end

local function toggle_vertical_terminal()
  _G.vertical_terminal:toggle()
end

local function toggle_float_terminal()
  _G.float_terminal:toggle()
end
return {
  {
    "akinsho/toggleterm.nvim",
    init = function()
      if vim.fn.has("win32") ~= 0 and vim.fn.executable("nu") ~= 0 then
        _G.cmd = "nu"
      else
        _G.cmd = nil
      end
    end,
    keys = {
      {
        "<leader>tt",
        toggle_float_terminal,
        mode = { "n", "v" },
        desc = "Float terminal",
      },
      {
        "<c-.>",
        toggle_float_terminal,
        mode = { "n", "t", "i", "v" },
        desc = "Float terminal",
      },
      {
        "<leader>tg",
        toggle_lazygit,
        desc = "LazyGit",
      },
      {
        "<leader>tr",
        toggle_ranger,
        desc = "Ranger",
      },
      {
        "<leader>th",
        toggle_horizonal_terminal,
        desc = "horziontal terminal",
      },
      {
        "<c-/>",
        toggle_vertical_terminal,
        mode = { "n", "t", "i", "v" },
        desc = "vertical terminal",
      },
    },
    config = function()
      require("toggleterm").setup()
      _G.lazygit = require("toggleterm.terminal").Terminal:new({
        cmd = "lazygit",
        hidden = true,
        direction = "float",
      })
      _G.ranger = require("toggleterm.terminal").Terminal:new({
        cmd = "ranger",
        hidden = true,
        direction = "float",
      })
      _G.horizonal_terminal = require("toggleterm.terminal").Terminal:new({
        cmd = _G.cmd,
        hidden = true,
        direction = "horizontal",
      })
      _G.vertical_terminal = require("toggleterm.terminal").Terminal:new({
        cmd = _G.cmd,
        hidden = true,
        direction = "vertical",
      })
      _G.float_terminal = require("toggleterm.terminal").Terminal:new({
        cmd = _G.cmd,
        hidden = true,
        direction = "float",
      })
    end,
  },
  {
    "willothy/flatten.nvim",
    opts = {
      window = {
        open = "alternate",
      },
    },
    lazy = false,
    priority = 1001,
  },
}
