-- Completion keymaps (blink.cmp)

return {
    "saghen/blink.cmp",
    opts = {
        completion = {
            accept = {
                auto_brackets = {
                    enabled = false,
                },
            },
            trigger = {
                show_on_keyword = true,
                show_on_trigger_character = true,
                show_on_insert_on_trigger_character = false,
            },
            ghost_text = {
                enabled = false,
            },
        },
        keymap = {
            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-j>"] = { "select_next", "fallback" },
            ["<CR>"] = { "accept", "fallback" },
            ["<C-e>"] = { "show", "hide", "fallback" },
        },
        sources = {
            default = { "lsp", "path" },
            per_filetype = {
                graphql = false,
            },
            -- Disable buffer and snippets sources
            providers = {
                buffer = { enabled = false },
                snippets = { enabled = false },
            },
        },
    },
}
