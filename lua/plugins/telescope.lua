return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<c-j>"] = function(...)
              return require("telescope.actions").move_selection_next(...)
            end,
            ["<c-k>"] = function(...)
              return require("telescope.actions").move_selection_previous(...)
            end,
          },
        },
        file_ignore_patterns = {
          "node_modules",
          "target",
          "build",
          "config_default",
        },
      },
    },
  },
}
