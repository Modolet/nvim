return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
      },
      filetypes = {
        -- slint = false,
      },
      -- suggestion = { enabled = false },
      -- panel = { enabled = false },
    },
  },
}
