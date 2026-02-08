-- ThePrimeagen's 99 - Neovim AI agent
return {
    "ThePrimeagen/99",
    config = function()
        local _99 = require("99")

        -- Ensure tmp directory exists (plugin doesn't create it)
        local cwd = vim.uv.cwd()
        local tmp_dir = cwd .. "/tmp"
        vim.fn.mkdir(tmp_dir, "p")

        -- Logging configuration
        local basename = vim.fs.basename(cwd)
        _99.setup({
            -- Fix model name (plugin default is wrong)
            model = "anthropic/claude-sonnet-4-5",

            logger = {
                level = _99.DEBUG,
                path = "/tmp/" .. basename .. ".99.debug",
                print_on_error = true,
            },

            -- Completion configuration for @ tags
            -- Note: Currently disabled as we use blink.cmp instead of nvim-cmp
            -- You can still type @ manually in prompts
            -- completion = {
            --     custom_rules = {},
            --     source = "cmp",
            -- },

            -- Auto-add markdown files based on location
            md_files = {
                "AGENTS.md",
            },
        })

        -- Fill in function implementation
        vim.keymap.set("n", "<leader>9f", function()
            _99.fill_in_function()
        end, { desc = "99: Fill in function" })

        -- Visual selection editing (with prompt)
        vim.keymap.set("v", "<leader>9v", function()
            local prompt = vim.fn.input("Instructions: ")
            if prompt and prompt ~= "" then
                -- Call with nil context and opts as second parameter
                _99.visual(nil, { additional_prompt = prompt })
            else
                print("No instructions provided, cancelled.")
            end
        end, { desc = "99: Edit visual selection with prompt" })

        -- Visual selection editing (auto, no prompt)
        vim.keymap.set("v", "<leader>9a", function()
            _99.visual()
        end, { desc = "99: Auto edit visual selection" })

        -- Stop all requests
        vim.keymap.set("n", "<leader>9s", function()
            _99.stop_all_requests()
        end, { desc = "99: Stop all requests" })

        -- View logs
        vim.keymap.set("n", "<leader>9l", function()
            _99.view_logs()
        end, { desc = "99: View logs" })

        -- Navigate logs
        vim.keymap.set("n", "<leader>9p", function()
            _99.prev_request_logs()
        end, { desc = "99: Previous request logs" })

        vim.keymap.set("n", "<leader>9n", function()
            _99.next_request_logs()
        end, { desc = "99: Next request logs" })
    end,
}
