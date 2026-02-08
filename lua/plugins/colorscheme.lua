-- Colorscheme configuration
-- Change this to switch colorscheme: "rose-pine", "solarized-osaka", "onedark"
local selected = "solarized-osaka"

return {
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
    -- LazyVim colorscheme setting
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = selected,
        },
    },
}
