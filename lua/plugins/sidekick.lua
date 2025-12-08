-- Sidekick.nvim - AI assistant integration
return {
  {
    "folke/sidekick.nvim",
    opts = {
      cli = {
        mux = {
          backend = "tmux",
          enabled = true,
        },
      },
      nes = { enabled = false },
    },
    keys = {
      {
        "<tab>",
        function()
          if not require("sidekick").nes_jump_or_apply() then
            return "<Tab>"
          end
        end,
        expr = true,
        desc = "Goto/Apply Next Edit Suggestion",
      },
      {
        "<leader>cc",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle",
        mode = { "n", "t", "i", "x" },
      },
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>ad",
        function()
          require("sidekick.cli").close()
        end,
        desc = "Detach a CLI Session",
      },
      {
        "<leader>cs",
        function()
          require("sidekick.cli").send({ msg = "{this}" })
        end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").prompt()
        end,
        desc = "Prompt Selector",
      },
      {
        "<leader>as",
        function()
          require("sidekick.cli").send({ msg = "{file}" })
        end,
        desc = "Send File",
      },
      {
        "<leader>cx",
        function()
          require("sidekick.cli").send({ msg = "{selection}" })
        end,
        mode = "x",
        desc = "Send Visual Selection",
      },
    },
  },
  {
    "JanSmrcka/nvim-auto-commit",
    cmd = "AICommit",
  },
}
