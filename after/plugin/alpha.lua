local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Function to create a colorful header
local function create_colored_header()
    local colors = {
        "#89b4fa", -- Catppuccin blue
        "#f5c2e7", -- Catppuccin pink
        "#a6e3a1", -- Catppuccin green
        "#fab387", -- Catppuccin peach
        "#94e2d5", -- Catppuccin teal
    }

    return {
        type = "text",
        val = {
            [[                                                ]],
            [[ ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ]],
            [[ ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ]],
            [[▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ]],
            [[▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ]],
            [[▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ]],
            [[░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ]],
            [[░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ]],
            [[   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ]],
            [[         ░    ░  ░    ░ ░        ░   ░         ░    ]],
            [[                                 ░                    ]],
            [[                                                ]],
        },
        opts = {
            position = "center",
            hl = "#f5c2e7",  -- Výchozí barva (Catppuccin pink)
        },
    }
end

-- Set header with custom highlight
local header = create_colored_header()
dashboard.section.header.val = header.val
dashboard.section.header.opts = header.opts

-- Custom section for statistics
dashboard.section.stats = {
    type = "group",
    val = {
        { type = "text", val = "📊 Quick Stats:", opts = { position = "center" } },
        { type = "padding", val = 1 },
        {
            type = "text",
            val = function()
                local plugins = #vim.tbl_keys(packer_plugins)
                local v = vim.version()
                local datetime = os.date " %d-%m-%Y   %H:%M:%S"
                return string.format("⚡ %d Plugins  v%d.%d.%d  %s", plugins, v.major, v.minor, v.patch, datetime)
            end,
            opts = { position = "center" },
        },
    },
}

-- Custom buttons with icons
dashboard.section.buttons.val = {
    dashboard.button("n", "📄 New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "🔍 Find file", ":Telescope find_files<CR>"),
    dashboard.button("r", "🕒 Recent files", ":Telescope oldfiles<CR>"),
    dashboard.button("t", "🔎 Find text", ":Telescope live_grep<CR>"),
    dashboard.button("c", "⚙️  Configuration", ":e $MYVIMRC <CR>"),
    dashboard.button("p", "📦 Update plugins", ":PackerSync<CR>"),
    dashboard.button("q", "🚪 Quit Neovim", ":qa<CR>"),
}

-- Get fortune quote safely
local function get_fortune()
    local handle = io.popen("fortune -s")
    if handle then
        local result = handle:read("*a")
        handle:close()
        -- Replace newlines with spaces and trim
        result = result:gsub("\n", " "):gsub("^%s*(.-)%s*$", "%1")
        return result
    end
    return "Ready to code! 🚀"
end

-- Social links
local function get_social_links()
    return {
        "🌟 Find me on:",
        "",
        "  🐙 GitHub:    https://github.com/JanSmrcka",
        "  💼 LinkedIn:  https://www.linkedin.com/in/jan-smrcka/",
        "  🌐 Web:       https://jansmrcka.dev",
    }
end

-- Quote section with social links
dashboard.section.footer = {
    type = "group",
    val = {
        { type = "text", val = "", opts = { position = "center" } },
        { type = "text", val = "🚀 Ready to code!", opts = { position = "center" } },
        { type = "text", val = "💡 Tip: Press ? to see keybindings", opts = { position = "center" } },
        { type = "text", val = "", opts = { position = "center" } },
        { type = "text", val = "「 " .. get_fortune() .. " 」", opts = { position = "center" } },
        { type = "padding", val = 1 },
        { type = "text", val = get_social_links(), opts = { position = "center", hl = "AlphaSocial" } },
        { type = "padding", val = 1 },
        { type = "text", val = "© Jan Smrčka 2024-2025", opts = { position = "center", hl = "AlphaCopyright" } },
    },
}

-- Set custom highlights
vim.api.nvim_set_hl(0, 'AlphaHeader', { fg = '#89b4fa' })    -- Catppuccin blue
vim.api.nvim_set_hl(0, 'AlphaButtons', { fg = '#a6e3a1' })   -- Catppuccin green
vim.api.nvim_set_hl(0, 'AlphaStats', { fg = '#f5c2e7' })     -- Catppuccin pink
vim.api.nvim_set_hl(0, 'AlphaQuote', { fg = '#fab387' })     -- Catppuccin peach
vim.api.nvim_set_hl(0, 'AlphaSocial', { fg = '#94e2d5' })    -- Catppuccin teal
vim.api.nvim_set_hl(0, 'AlphaCopyright', { fg = '#9399b2', italic = true }) -- Subtle gray with italic

-- Apply highlights and center alignment
dashboard.section.header.opts = {
    position = "center",
    hl = "AlphaHeader"
}
dashboard.section.buttons.opts = {
    position = "center",
    hl = "AlphaButtons"
}
dashboard.section.stats.opts = {
    position = "center",
    hl = "AlphaStats"
}

-- Layout configuration
local config = {
    layout = {
        { type = "padding", val = 2 },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.stats,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 1 },
        dashboard.section.footer,
    },
    opts = {
        margin = 5,
        noautocmd = true,
    },
}

-- Setup alpha
alpha.setup(config)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])

-- Print debug info when alpha loads
vim.api.nvim_create_autocmd("User", {
    pattern = "AlphaReady",
    callback = function()
        local colors = {
            "#89b4fa", -- Catppuccin blue
            "#f5c2e7", -- Catppuccin pink
            "#a6e3a1", -- Catppuccin green
            "#fab387", -- Catppuccin peach
            "#94e2d5", -- Catppuccin teal
        }
        vim.api.nvim_set_hl(0, 'AlphaHeader', { fg = colors[math.random(#colors)] })
        for _, val in ipairs(dashboard.section.header.val) do
            vim.api.nvim_set_hl(0, 'AlphaHeader', { fg = colors[math.random(#colors)] })
        end
    end,
})

