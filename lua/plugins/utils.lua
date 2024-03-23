return {
  {
    "lambdalisue/suda.vim",
  },
  {
    "LhKipp/nvim-nu",
    config = true,
  },
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "smoka7/hydra.nvim",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        mode = { "v", "n" },
        "<c-n>",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for selected text or word under the cursor",
      },
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
  },
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
      require("hlchunk").setup({
        chunk = {
          notify = false,
        },
        blank = {
          enable = false,
        },
        line_num = {
          enable = false,
          use_treesitter = true,
        },
        -- indent = {
        --   chars = {
        --     "│",
        --   },
        -- style = {
        --   "#FF0000",
        --   "#FF7F00",
        --   "#FFFF00",
        --   "#00FF00",
        --   "#00FFFF",
        --   "#0000FF",
        --   "#8B00FF",
        -- },
        -- },
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      indent = {
        enable = false, -- 启用后会导致slint的缩进错误
      },
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
  {
    "goolord/alpha-nvim",
    opts = function(_, dashboard)
      local logo = [[
 ███  ███   ░████░   █████▒     ░████░   ██▒  ▒██   ██████   ███  ███ 
 ███  ███   ██████   ███████    ██████   ██▓  ▓██   ██████   ███  ███ 
 ███▒▒███  ▒██  ██▒  ██  ▒██▒  ▒██  ██▒  ▒██  ██▒     ██     ███▒▒███ 
 ███▓▓███  ██▒  ▒██  ██   ▒██  ██▒  ▒██  ▒██  ██▒     ██     ███▓▓███ 
 ██▓██▓██  ██    ██  ██   ░██  ██    ██   ██ ░██      ██     ██▓██▓██ 
 ██▒██▒██  ██    ██  ██    ██  ██    ██   ██▒▒██      ██     ██▒██▒██ 
 ██░██░██  ██    ██  ██    ██  ██    ██   ██▒▒██      ██     ██░██░██ 
 ██ ██ ██  ██    ██  ██   ░██  ██    ██   ▒████▒      ██     ██ ██ ██ 
 ██    ██  ██▒  ▒██  ██   ▒██  ██▒  ▒██   ░████░      ██     ██    ██ 
 ██    ██  ▒██  ██▒  ██  ▒██▒  ▒██  ██▒    ████       ██     ██    ██ 
 ██    ██   ██████   ███████    ██████     ████     ██████   ██    ██ 
 ██    ██   ░████░   █████▒     ░████░     ▓██▓     ██████   ██    ██ 
      ]]
      dashboard.section.header.val = vim.split(logo, "\n")
    end,
  },
}
