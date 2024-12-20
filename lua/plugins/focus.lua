return {
  {
    "nvim-focus/focus.nvim",
    config = true,
    opts = {
      autoresize = {
        enable = true, -- Enable or disable auto-resizing of splits
        width = 0, -- Force width for the focused window
        height = 0, -- Force height for the focused window
        minwidth = 20, -- Force minimum width for the unfocused window
        minheight = 4, -- Force minimum height for the unfocused window
        height_quickfix = 10, -- Set the height of quickfix panel
      },
    },
  },
}
