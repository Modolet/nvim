return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      -- default prompts
      prompts = {
        Explain = {
          prompt = "> /COPILOT_EXPLAIN\n\n用段落形式为选中的代码写一份解释。请使用中文。",
        },
        Review = {
          prompt = "> /COPILOT_REVIEW\n\n审查选中的代码。请使用中文。",
        },
        Fix = {
          prompt = "> /COPILOT_GENERATE\n\n这段代码存在问题。请重写代码并修复其中的错误。请使用中文。并说明你修改的地方。",
        },
        Optimize = {
          prompt = "> /COPILOT_GENERATE\n\n优化选中的代码以提高性能和可读性。请使用中文。并说明你修改的地方。",
        },
        Docs = {
          prompt = "> /COPILOT_GENERATE\n\n请为选中的代码添加文档注释。请使用中文。",
        },
        Tests = {
          prompt = "> /COPILOT_GENERATE\n\n请为我的代码生成测试。请使用中文。",
        },
        Commit = {
          prompt = "> #git:staged\n\nWrite commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
        },
      },
      mappings = {
        accept_diff = {
          normal = "<leader>ay",
          insert = "<C-y>",
        },
      },
    },
  },
}
