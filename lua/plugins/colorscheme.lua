-- Colorscheme configuration
-- Change this to switch colorscheme: "rose-pine", "solarized-osaka", "onedark", "tokyonight"
local selected = "tokyonight"

return {
    -- TokyoNight
    {
        "folke/tokyonight.nvim",
        lazy = selected ~= "tokyonight",
        priority = 1000,
        opts = {
            style = "storm",
            transparent = true,
            terminal_colors = true,
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                sidebars = "transparent",
                floats = "transparent",
            },
        },
    },
    -- Rose Pine
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = selected ~= "rose-pine",
        priority = 1000,
        opts = {
            variant = "main", -- "main", "moon", "dawn"
            dark_variant = "main",
            dim_inactive_windows = false,
            extend_background_behind_borders = false,
            styles = {
                bold = true,
                italic = true,
                transparency = true,
            },
        },
    },
    -- Solarized Osaka
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = selected ~= "solarized-osaka",
        priority = 1000,
        opts = {
            transparent = true,
            terminal_colors = true,
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                functions = {},
                variables = {},
                sidebars = "transparent",
                floats = "transparent",
            },
            sidebars = { "qf", "help" },
            dim_inactive = false,
            lualine_bold = false,
            on_highlights = function(hl, c)
                -- Subtle bracket matching - muted background + colored underline
                hl.MatchParen = {
                    bg = c.bg_highlight,
                    fg = c.cyan,
                    underline = true,
                    sp = c.cyan, -- underline color
                    bold = true,
                }
            end,
        },
    },
    -- OneDark
    {
        "navarasu/onedark.nvim",
        lazy = selected ~= "onedark",
        priority = 1000,
        opts = {
            style = "darker",
            transparent = true,
            term_colors = true,
        },
    },
    -- Lualine - minimal tokyonight style
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                theme = {
                    normal = {
                        a = { fg = "#24283b", bg = "#7aa2f7", gui = "bold" },
                        b = { fg = "#c0caf5", bg = "NONE" },
                        c = { fg = "#565f89", bg = "NONE" },
                    },
                    insert = {
                        a = { fg = "#24283b", bg = "#9ece6a", gui = "bold" },
                    },
                    visual = {
                        a = { fg = "#24283b", bg = "#bb9af7", gui = "bold" },
                    },
                    replace = {
                        a = { fg = "#24283b", bg = "#f7768e", gui = "bold" },
                    },
                    command = {
                        a = { fg = "#24283b", bg = "#e0af68", gui = "bold" },
                    },
                    inactive = {
                        a = { fg = "#565f89", bg = "NONE" },
                        b = { fg = "#565f89", bg = "NONE" },
                        c = { fg = "#565f89", bg = "NONE" },
                    },
                },
            },
        },
    },
    -- LazyVim colorscheme setting
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = selected,
        },
    },
}
