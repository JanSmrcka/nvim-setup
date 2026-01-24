-- Sidekick.nvim - AI assistant integration
return {
    -- WebSocket server pro IDE integraci (bez vlastního UI)
    {
        "coder/claudecode.nvim",
        opts = {
            terminal = {
                provider = "none", -- bez vlastního UI, jen WebSocket server
            },
            auto_start = true,
        },
    },
    {
        "folke/sidekick.nvim",
        opts = {
            cli = {
                mux = {
                    enabled = false,
                },
                tools = {
                    claude = {
                        cmd = { "claude" }, -- Claude automaticky najde WebSocket server
                    },
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
                "<leader>ai",
                function()
                    require("sidekick.cli").toggle()
                end,
                desc = "Sidekick Toggle",
                mode = { "n", "t", "i", "x" },
            },
            {
                "<leader>si",
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
