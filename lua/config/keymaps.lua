-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

-- Copy relative path to clipboard
vim.keymap.set("n", "<leader>cr", function()
    vim.fn.setreg("+", vim.fn.expand("%"))
    print("Relative path copied: " .. vim.fn.expand("%"))
end, { desc = "Copy relative path to clipboard" })

-- Join lines keeping cursor position
vim.keymap.set("n", "J", "mzJ`z")

-- Move lines up and down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Center screen on navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with Ctrl+S
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", opts)
vim.keymap.set("n", "<C-s>", ":w<CR>", opts)
vim.keymap.set("v", "<C-s>", "<ESC>:w<CR>", opts)

-- Quit on Ctrl+Q
vim.keymap.set("n", "<C-q>", ":q<CR>", opts)

-- Command-line navigation
vim.keymap.set("c", "<C-j>", "<C-n>", opts)
vim.keymap.set("c", "<C-k>", "<C-p>", opts)

-- Paste without yanking replaced text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Delete to black hole register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Escape alternative
vim.keymap.set("i", "<C-c>", "<Esc>")
-- Disable Q
vim.keymap.set("n", "Q", "<nop>")

-- Tmux integration
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-fuzzy.sh<CR>")

-- Search and replace word under cursor
vim.keymap.set(
    "n",
    "<leader>sr",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Search and replace word" }
)

-- Make file executable
vim.keymap.set(
    "n",
    "<leader>x",
    "<cmd>!chmod +x %<CR>",
    { silent = true, desc = "Make file executable" }
)

-- AI Commit
vim.keymap.set("n", "<leader>gac", "<cmd>AICommit<CR>", { desc = "AI Commit" })

-- Focus last floating window
vim.keymap.set("n", "<leader>vf", function()
    local floats = {}
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local ok, cfg = pcall(vim.api.nvim_win_get_config, win)
        if ok and cfg and cfg.relative and cfg.relative ~= "" then
            table.insert(floats, win)
        end
    end
    if floats[#floats] then
        vim.api.nvim_set_current_win(floats[#floats])
    end
end, { desc = "Focus last floating window" })

-- LSP keymaps (your old config style)
vim.keymap.set("n", "<leader>vws", function()
    vim.lsp.buf.workspace_symbol()
end, { desc = "Workspace symbols" })
vim.keymap.set("n", "<leader>vd", function()
    vim.diagnostic.open_float()
end, { desc = "Open diagnostic float" })
vim.keymap.set("n", "<C-]>", function()
    vim.diagnostic.goto_next()
end, { desc = "Next diagnostic" })
vim.keymap.set("n", "<C-[>", function()
    vim.diagnostic.goto_prev()
end, { desc = "Prev diagnostic" })
vim.keymap.set("n", "<leader>vca", function()
    vim.lsp.buf.code_action()
end, { desc = "Code action" })
vim.keymap.set("n", "<leader>vrr", function()
    vim.lsp.buf.references()
end, { desc = "References" })
vim.keymap.set("n", "<leader>vrn", function()
    vim.lsp.buf.rename()
end, { desc = "Rename" })
vim.keymap.set("i", "<C-h>", function()
    vim.lsp.buf.signature_help()
end, { desc = "Signature help" })

-- Quickfix navigation
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>zz", { desc = "Prev quickfix" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next loclist" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Prev loclist" })

-- Resize window (Option + Shift + h/j/k/l)
vim.keymap.set(
    "n",
    "<M-S-k>",
    "<cmd>resize +2<cr>",
    { desc = "Increase Window Height" }
)
vim.keymap.set(
    "n",
    "<M-S-j>",
    "<cmd>resize -2<cr>",
    { desc = "Decrease Window Height" }
)
vim.keymap.set(
    "n",
    "<M-S-h>",
    "<cmd>vertical resize -2<cr>",
    { desc = "Decrease Window Width" }
)
vim.keymap.set(
    "n",
    "<M-S-l>",
    "<cmd>vertical resize +2<cr>",
    { desc = "Increase Window Width" }
)
