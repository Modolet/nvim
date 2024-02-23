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
        blank = {
          enable = false,
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
}
