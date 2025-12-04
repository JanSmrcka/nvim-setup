-- Key mappings
-- Migrated from lua/jendis/remap.lua

local opts = { noremap = true, silent = true }

-- Navigate between splits
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Copy relative path to clipboard
vim.keymap.set('n', '<leader>cr', function()
  vim.fn.setreg('+', vim.fn.expand('%'))
  print("📎 Relative path copied to clipboard: " .. vim.fn.expand('%'))
end, { desc = "Copy relative path to clipboard" })

-- Move lines up and down in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Join lines keeping cursor position
vim.keymap.set("n", "J", "mzJ`z")

-- Center screen on navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Quick quit
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>")

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with Ctrl+S
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', opts)
vim.api.nvim_set_keymap('v', '<C-s>', '<ESC>:w<CR>', opts)

-- Command-line navigation
vim.api.nvim_set_keymap('c', '<C-j>', '<C-n>', opts)
vim.api.nvim_set_keymap('c', '<C-k>', '<C-p>', opts)

-- Paste without yanking replaced text
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to black hole register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Escape alternative
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")

-- Tmux integration
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-fuzzy.sh<CR>")

-- LSP format
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)

-- Quickfix navigation
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Search and replace word under cursor
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- AI Commit
vim.keymap.set("n", "<leader>gac", "<cmd>AICommit<CR>", { desc = "AI Commit with auto-generated message" })

-- Source current file
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)
