require("todo-comments").setup({
    signs = true, -- show icons in the sign column
    keywords = {
        FIX = {
            icon = " ", -- icon used for the sign
            color = "error", -- can be a hex color, or a named color
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- alternatives
        },
        TODO = { icon = " ", color = "info" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
    },
    highlight = {
        before = "", -- "fg" or "bg" or empty
        keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty
        after = "fg", -- "fg" or "bg" or empty
        pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns
        comments_only = true, -- uses treesitter to match keywords in comments only
    },
})

-- Keymaps for todo-comments
vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- Search todo comments using Telescope
vim.keymap.set("n", "<leader>pt", ":TodoTelescope<CR>", { desc = "Find todos" }) 