return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<F9>",
        function()
          require("dap").continue()
        end,
        desc = "Run/Continue",
      },
      {
        "<M-F9>",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
      },
      {
        "<F7>",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<S-F8>",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<F8>",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
    },
  },
}
