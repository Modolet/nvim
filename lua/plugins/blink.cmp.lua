return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "super-tab",
        ["<c-k>"] = { "select_prev", "fallback" },
        ["<c-j>"] = { "select_next", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
      },
    },
  },
}
