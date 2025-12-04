local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Function to create a colorful header using centralized colors
local function create_colored_header()
    local theme_colors = GetCurrentColors and GetCurrentColors() or {
        primary = "#61afef", secondary = "#c678dd", accent = "#56b6c2",
        success = "#98c379", warning = "#e5c07b"
    }

    local colors = {
        theme_colors.primary,
        theme_colors.secondary,
        theme_colors.success,
        theme_colors.warning,
        theme_colors.accent,
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
            hl = "String", -- Použije výchozí barvu tématu
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
                local plugins = require("lazy").stats().count
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
    dashboard.button("p", "📦 Update plugins", ":Lazy sync<CR>"),
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

-- Barvy Alpha se nyní nastavují centrálně v colors.lua

-- Apply highlights and center alignment using default theme colors
dashboard.section.header.opts = {
    position = "center",
    hl = "String"
}
dashboard.section.buttons.opts = {
    position = "center",
    hl = "Function"
}
dashboard.section.stats.opts = {
    position = "center",
    hl = "Number"
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

-- Alpha používá výchozí barvy tématu

