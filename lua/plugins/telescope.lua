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
          ".git",
          ".cache",
          ".venv",
          ".vscode",
          ".idea",
          ".DS_Store",
          ".Trash",
          ".fzf",
          ".local",
          ".config",
          ".cache",
          ".npm",
          ".rvm",
          ".gem",
          ".cargo",
          ".stack",
          ".cabal",
          ".ghc",
          ".stack-work",
          ".vagrant",
          ".terraform",
          "target",
        },
      },
    },
  },
}
