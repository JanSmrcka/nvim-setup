-- Neovim options and settings
-- Migrated from lua/jendis/set.lua

-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Disable netrw (using neo-tree instead)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Cursor
vim.opt.guicursor = {
  'n-v-c:block',   -- Normal, Visual, Command modes: block cursor
  'i-ci-ve:ver25', -- Insert, Command-line insert, Visual: vertical bar cursor
  'r-cr:hor20',    -- Replace mode: horizontal bar cursor
  'o:hor50',       -- Operator-pending mode: horizontal bar cursor
}

-- Colors
vim.opt.termguicolors = true

-- Disable optional remote providers to silence health warnings
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Line wrapping
vim.opt.wrap = false

-- Swap and backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Scrolling
vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Update time
vim.opt.updatetime = 100

-- Color column
vim.opt.colorcolumn = ""

-- Auto reload files
vim.o.autoread = true

-- Folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 99
vim.opt.foldenable = true

-- Diagnostics configuration
vim.diagnostic.config({
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN]  = ' ',
      [vim.diagnostic.severity.INFO]  = ' ',
      [vim.diagnostic.severity.HINT]  = '󰌵',
    },
  },
  float = {
    focusable = false,
    border = 'rounded',
    source = 'always',
    close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'FocusLost', 'BufHidden', 'BufEnter' },
  },
})

-- Yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 200 })
  end,
})

-- Auto reload on focus/buffer changes
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  pattern = "*",
  command = "checktime",
})

-- Close lingering floating windows when entering a normal file buffer
local function close_lingering_floats()
  local buf = vim.api.nvim_get_current_buf()
  local bt = vim.bo[buf].buftype
  local ft = vim.bo[buf].filetype
  local curwin = vim.api.nvim_get_current_win()
  local curcfg = vim.api.nvim_win_get_config(curwin)

  -- If we are currently inside a floating window, don't close it
  if curcfg and curcfg.relative and curcfg.relative ~= '' then
    return
  end

  local function close_all_floats()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local ok, cfg = pcall(vim.api.nvim_win_get_config, win)
      if ok and cfg and cfg.relative and cfg.relative ~= '' then
        pcall(vim.api.nvim_win_close, win, true)
      end
    end
  end

  -- Always close when entering neo-tree
  if ft == 'neo-tree' then
    close_all_floats()
    return
  end

  -- Otherwise only act for regular file buffers; skip common plugin UIs
  if bt ~= '' then return end
  if ft == 'TelescopePrompt' or ft == 'alpha' or ft == 'which_key' then return end

  close_all_floats()
end

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  callback = close_lingering_floats,
  desc = 'Close lingering floating windows when entering a file buffer',
})

-- Map to focus the latest floating window (e.g., diagnostic popup) to allow copying text
local function focus_last_float()
  local floats = {}
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local ok, cfg = pcall(vim.api.nvim_win_get_config, win)
    if ok and cfg and cfg.relative and cfg.relative ~= '' then
      table.insert(floats, win)
    end
  end
  local target = floats[#floats]
  if target then
    vim.api.nvim_set_current_win(target)
  else
    vim.notify('No floating window found', vim.log.levels.INFO)
  end
end

vim.keymap.set('n', '<leader>vf', focus_last_float, { desc = 'Focus last floating window' })
