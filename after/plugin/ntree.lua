-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Optionally enable 24-bit colour
vim.opt.termguicolors = true

require('nvim-tree').setup({
  update_focused_file = {
    enable = true,                -- Enables highlighting of the current file
    update_cwd = true,            -- Updates the current working directory
    ignore_list = {},             -- Files to ignore
  },
  view = {
    width = 40,                   -- Manually set the width of the nvim-tree window
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
  -- Key mappings for navigation in nvim-tree
  on_attach = function(bufnr)
    local api = require('nvim-tree.api')

    -- Key mappings inside nvim-tree buffer
    local opts = { noremap = true, silent = true, nowait = true, buffer = bufnr }

    -- Navigation using hjkl
    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts)  -- Close folder (collapse)
    vim.keymap.set('n', 'l', api.node.open.edit, opts)              -- Open folder or file (expand folder)

    -- Other useful mappings (optional)
    vim.keymap.set('n', 'r', api.fs.rename, opts)  -- Rename file or directory
    vim.keymap.set('n', 'd', api.fs.remove, opts)  -- Delete file or directory
    vim.keymap.set('n', 'a', api.fs.create, opts)  -- Create new file or directory
    vim.keymap.set('n', 'R', api.tree.reload, opts) -- Refresh tree
  end
})

-- Make nvim-tree background transparent
vim.cmd([[
  hi NvimTreeNormal guibg=NONE ctermbg=NONE
  hi NvimTreeNormalNC guibg=NONE ctermbg=NONE
  hi NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE
]])
-- Keybindings to toggle nvim-tree and focus on the current file
vim.api.nvim_set_keymap('n', '<leader>i', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>pt', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })
