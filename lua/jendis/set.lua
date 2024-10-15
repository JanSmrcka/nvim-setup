vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
-- Correct Lua syntax for setting 'guicursor'
vim.opt.guicursor = {
  'n-v-c:block',   -- Normal, Visual, Command modes: block cursor
  'i-ci-ve:ver25', -- Insert, Command-line insert, Visual: vertical bar cursor
  'r-cr:hor20',    -- Replace mode: horizontal bar cursor
  'o:hor50',       -- Operator-pending mode: horizontal bar cursor
}
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = ""

vim.cmd([[
hi YankHighlight guibg=#ffeb3b guifg=red
]])
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 200 })
  end,
})
-- Define a custom highlight group for yanked text

vim.diagnostic.config({
  severity_sort = true,
})

vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.foldenable = true
