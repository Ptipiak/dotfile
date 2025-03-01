local function read_file(path)
    local file = io.open(path, "rb") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

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
            content = 'You are an AI programming assistant named "CodeCompanion". You are currently plugged in to the Neovim text editor on a user\'s machine.'
          },
          {
            role = "user",
            content = "Explain to me why this crash happend and what can I do to fix it."
          }
        },
      }
    }
  },
  config = function(_, opts)
    require("codecompanion").setup(opts)
  end
}
