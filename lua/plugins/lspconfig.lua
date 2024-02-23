return {
  {
    "neovim/nvim-lspconfig",
    format = {
      formatting_options = nil,
      timeout_ms = nil,
    },
    opts = {
      servers = {
        slint_lsp = {},
      },
      setup = {
        slint_lsp = function(_, opts)
          opts.capabilities = { offsetEncoding = { "utf-8", "utf-16" } }
          opts.root_dir = function(fname)
            if fname == nil then
              fname = vim.fn.expand("%:p")
            end
            local lsputil = require("lspconfig.util")
            return lsputil.root_pattern(".git", ".hg", ".svn", "package.json", "Cargo.toml")(fname)
              or lsputil.find_git_ancestor(fname)
              or "."
          end
        end,
        copilot = function(_, opts)
          opts.capabilities = { offsetEncoding = { "utf-8", "utf-16" } }
        end,
        clangd = function(_, opts)
          opts.capabilities = { offsetEncoding = { "utf-8", "utf-16" } }
        end,
      },
    },
  },
}
