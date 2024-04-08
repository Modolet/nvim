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
        html = {},
        cssls = {},
        volar = {},
        tsserver = {},
      },
      inlay_hints = {
        enabled = true,
      },
      setup = {

        slint_lsp = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-8", "utf-16" }
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
          opts.capabilities.offsetEncoding = { "utf-8", "utf-16" }
        end,
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-8", "utf-16" }
        end,
        volar = function(_, opts)
          local util = require("lspconfig.util")
          local function get_typescript_server_path(root_dir)
            local global_ts = "~/.npm/lib/node_modules/typescript/lib"
            -- Alternative location if installed as root:
            -- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
            local found_ts = ""
            local function check_dir(path)
              found_ts = util.path.join(path, "node_modules", "typescript", "lib")
              if util.path.exists(found_ts) then
                return path
              end
            end
            if util.search_ancestors(root_dir, check_dir) then
              return found_ts
            else
              return global_ts
            end
          end
          opts.on_new_config = function(new_config, new_root_dir)
            local path = get_typescript_server_path(new_root_dir)
            new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
          end
        end,
        tsserver = function(_, opts)
          opts.init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
                languages = { "javascript", "typescript", "vue" },
              },
            },
          }
          opts.filetypes = {
            "javascript",
            "typescript",
            "vue",
          }
        end,
      },
    },
  },
}
