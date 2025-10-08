-- Other options for ollama
-- https://github.com/David-Kunz/gen.nvim
-- https://github.com/nomnivore/ollama.nvim

return {
  -- https://codecompanion.olimorris.dev/
  {
    "olimorris/codecompanion.nvim",
    opts = {
      strategies = {
        chat = {
          adapter = {
            name = "ollama",
            model = "gemma3",
          },
        },
        inline = {
          adapter = {
            name = "ollama",
            model = "gemma3",
          },
        },
      },
      adapters = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            env = {
              url = "http://192.168.0.4:11434",
            },
            parameters = {
              sync = true,
            },
          })
        end,
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
