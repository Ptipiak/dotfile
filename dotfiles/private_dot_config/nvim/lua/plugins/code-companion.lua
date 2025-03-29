package.path = vim.fn.stdpath("config") .. "/lua/plugins/prompts/?.lua;" .. package.path
local prompts = require("prompts")

return {
  "olimorris/codecompanion.nvim",
  name = "codecompanion",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = {
      chat = {
        adapter = "llamacpp",
      },
      inline = {
        adapter = "llamacpp",
      },
    },
    adapters = {
      llamacpp = function ()
        return require("codecompanion.adapters").extend("openai_compatible", {
          env = {
            url = "http://localhost:5001",
            chat_url = "/v1/chat/completions",
          },
          schema = {
            model = {
              default = "Qwen2.5.1-Coder-7B-Instruct-Q6_K_L.gguf"
            }
          }
        })
      end
    },
    display = {
      action_palette = {
        provider = "telescope",
      }
    },
    prompt_library = {
      ["Report"] = {
        strategy = "chat",
        description = "Analyze a crash report",
        prompts = {
          {
            role = "system",
            content = prompts.report.system
          },
          {
            role = "user",
            content = prompts.report.user
          }
        },
      }
    }
  },
  config = function(_, opts)
    require("codecompanion").setup(opts)
  end
}
