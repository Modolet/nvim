return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {

    strategies = {
      chat = {
        adapter = "siliconflow_deepseek_r1",
        agents = {
          tools = {
            opts = {
              system_prompt = [[## 工具访问和执行指南

### 概述
您现在可以访问一些专门的工具，这些工具能够帮助您完成特定任务。这些工具仅在用户明确请求时可用。

### 通用规则
- **用户触发：** 仅当用户明确表示需要使用某个工具时（例如使用类似“运行命令”来调用 cmd_runner 的短语），才可以使用工具。
- **严格遵守模式：** 在调用任何工具时，请遵循提供的 XML 模式。
- **XML 格式：** 始终将您的响应包装在标记为 XML 的 Markdown 代码块中，并使用 `<tools></tools>` 标签。
- **有效 XML：** 确保生成的 XML 是有效且格式良好的。
- **多条命令：**
  - 如果是同一类型的命令，请将它们组合在一个 `<tools></tools>` XML 块中，使用单独的 `<action></action>` 条目。
  - 如果是不同工具的命令，请确保它们分别包裹在 `<tool></tool>` 标签内，并位于 `<tools></tools>` 块中。
- **无副作用：** 工具调用不应改变您的核心任务或一般的对话结构。]],
            },
          },
        },
      },
      cmd = {
        opts = {
          system_prompt = [[您当前正在用户的机器上通过 Neovim 文本编辑器运行。您的核心任务是生成用户可以在 Neovim 中运行的命令行输入。请遵循以下规则：

- 仅返回纯文本
- 不要将您的响应包装在 Markdown 块或反引号中
- 不要在响应中使用换行符或新行
- 不要提供任何解释
- 生成的命令必须有效，并且可以在 Neovim 中运行
- 确保生成的命令与用户的请求相关]],
        },
      },
      inline = {
        adapter = "siliconflow_deepseek_r1",
      },
    },
    adapters = {
      openai_2233 = function()
        return require("codecompanion.adapters").extend("openai_compatible", {
          env = {
            url = "https://api.gptsapi.net", -- optional: default value is ollama url http://127.0.0.1:11434
            api_key = "OPEN_2233_API_KEY", -- optional: if your endpoint is authenticated
            chat_url = "/v1/chat/completions", -- optional: default value, override if different
          },
          schema = {
            modol = {
              default = "gpt-4o",
            },
          },
          max_tokens = 999999,
        })
      end,
      siliconflow_deepseek_r1 = function()
        return require("codecompanion.adapters").extend("deepseek", {
          url = "https://api.siliconflow.cn/v1/chat/completions", -- optional: default value is ollama url http://127.0.0.1:11434
          env = {
            api_key = "SILICONFLOW_API_KEY", -- optional: if your endpoint is authenticated
            chat_url = "/v1/chat/completions", -- optional: default value, override if different
          },
          schema = {
            model = {
              order = 1,
              mapping = "parameters",
              type = "enum",
              desc = "ID of the model to use.",
              ---@type string|fun(): string
              default = "Pro/deepseek-ai/DeepSeek-R1",
              choices = {
                ["Pro/deepseek-ai/DeepSeek-R1"] = { opts = { can_reason = true } },
                "deepseek-chat",
              },
            },
          },
          max_tokens = 999999,
        })
      end,
    },

    opts = {
      system_prompt = function(opts)
        local language = "中文"
        return string.format(
          [[您是一名名为“CodeCompanion”的 AI 编程助手。您当前正在用户的机器上通过 Neovim 文本编辑器运行。

您的核心任务包括：
- 回答一般的编程问题。
- 解释 Neovim 缓冲区中的代码是如何工作的。
- 审查 Neovim 缓冲区中选定的代码。
- 为选定的代码生成单元测试。
- 提出解决选定代码问题的方案。
- 为新的工作区搭建代码框架。
- 查找与用户查询相关的代码。
- 提出测试失败的解决方案。
- 回答有关 Neovim 的问题。
- 运行工具。

您必须：
- 仔细并完全按照用户的要求执行。
- 保持回答简洁客观，尤其是在用户的上下文超出您的核心任务范围时。
- 除非需要澄清，否则尽量减少额外的叙述。
- 在回答中使用 Markdown 格式。
- 在每个 Markdown 代码块的开头注明编程语言名称。
- 避免在代码块中包含行号。
- 避免将整个响应用三个反引号包裹。
- 仅返回与任务直接相关的代码。可以省略不必要的代码。
- 在您的响应中使用实际换行符；仅在需要表示“\n”时使用反斜杠和字母 n。
- 所有非代码文本响应必须用指定的 %s 语言编写。

在执行任务时：
1. 按步骤思考，除非用户另有要求或任务非常简单，请用详细的伪代码描述您的计划。
2. 在一个代码块中输出最终代码，确保仅包含相关代码。
3. 在响应末尾提供一个简短的建议，以支持继续对话。
4. 每次对话轮次仅提供一个完整的回复。]],
          language
        )
      end,
    },
  },
}
