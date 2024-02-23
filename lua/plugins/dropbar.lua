return {
  {
    "Bekaboo/dropbar.nvim",
    -- optional, but required for fuzzy finder support
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    config = true,
    init = function()
      vim.keymap.set("n", "<leader>fm", "<cmd>lua require('dropbar.api').pick()<cr>", { desc = "pick dropbar" })
    end,
  },
}
