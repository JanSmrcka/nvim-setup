-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Use telescope as picker instead of fzf-lua
vim.g.lazyvim_picker = "telescope"

-- Cursor
vim.opt.guicursor = {
  "n-v-c:block",
  "i-ci-ve:ver25",
  "r-cr:hor20",
  "o:hor50",
}

-- Indentation (2 spaces)
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Scrolling
vim.opt.scrolloff = 12

-- Update time
vim.opt.updatetime = 100

-- Folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.foldenable = true

-- Undo directory
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Auto reload files
vim.o.autoread = true

-- Diagnostics configuration
vim.diagnostic.config({
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = "󰌵",
    },
  },
  float = {
    focusable = false,
    border = "rounded",
    source = "always",
  },
})
