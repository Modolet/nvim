return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      -- indent = {
      -- enable = false, -- 启用后会导致slint的缩进错误
      -- },
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
}
