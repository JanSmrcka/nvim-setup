-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { noremap = true, silent = true }

-- Copy relative path to clipboard
vim.keymap.set('n', '<leader>cr', function()
  vim.fn.setreg('+', vim.fn.expand('%'))
  print("Relative path copied: " .. vim.fn.expand('%'))
end, { desc = "Copy relative path to clipboard" })

-- Join lines keeping cursor position
vim.keymap.set("n", "J", "mzJ`z")

-- Center screen on navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with Ctrl+S
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>', opts)
vim.keymap.set('n', '<C-s>', ':w<CR>', opts)
vim.keymap.set('v', '<C-s>', '<ESC>:w<CR>', opts)

-- Command-line navigation
vim.keymap.set('c', '<C-j>', '<C-n>', opts)
vim.keymap.set('c', '<C-k>', '<C-p>', opts)

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
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace word" })

-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- AI Commit
vim.keymap.set("n", "<leader>gac", "<cmd>AICommit<CR>", { desc = "AI Commit" })

-- Focus last floating window
vim.keymap.set('n', '<leader>vf', function()
  local floats = {}
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local ok, cfg = pcall(vim.api.nvim_win_get_config, win)
    if ok and cfg and cfg.relative and cfg.relative ~= '' then
      table.insert(floats, win)
    end
  end
  if floats[#floats] then
    vim.api.nvim_set_current_win(floats[#floats])
  end
end, { desc = 'Focus last floating window' })
