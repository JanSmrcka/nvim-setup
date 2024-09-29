-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
--
-- Open nvim-tree
vim.api.nvim_set_keymap('n', '<leader>pv', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- Open nvim-tree and focus on the current file
vim.api.nvim_set_keymap('n', '<leader>pt', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })


require('nvim-tree').setup {
  update_focused_file = {
    enable = true,                -- Enables highlighting of the current file
    update_cwd = true,            -- Updates the current working directory
    ignore_list = {}              -- Files to ignore
  },
  view = {
    width = 30,                   -- Manually set the width of the nvim-tree window
    side = 'left',                -- Position the tree on the left side
    preserve_window_proportions = true, -- Preserve window proportions when resizing
  },
  renderer = {
    highlight_opened_files = "all",  -- Highlight all opened files in the tree
    group_empty = true,              -- Group empty directories
  },
  actions = {
    open_file = {
      quit_on_open = false,  -- Don't close the tree after opening a file
      window_picker = {
        enable = false,      -- Disable the window picker, for direct opening
      },
    },
  },
}
