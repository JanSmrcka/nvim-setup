-- Disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Setup for nvim-tree with icons and more visual improvements
require('nvim-tree').setup({
  update_focused_file = {
    enable = true,     -- Highlight the current file
    update_cwd = true, -- Update the current working directory to the tree's root
    ignore_list = {},  -- Files to ignore
  },
  view = {
    width = 40,                         -- Set the width of the nvim-tree window
    side = 'left',                      -- Place the tree on the left side
    preserve_window_proportions = true, -- Preserve window proportions
  },
  renderer = {
    icons = {
      glyphs = {
        default = '', -- Default file icon
        symlink = '', -- Symlink file icon
        folder = {
          arrow_open = '', -- Open folder arrow
          arrow_closed = '', -- Closed folder arrow
          default = '', -- Default folder icon
          open = '', -- Open folder icon
          empty = '', -- Empty folder icon
          empty_open = '', -- Open empty folder icon
          symlink = '', -- Symlink folder icon
        },
        git = {
          unstaged = "",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌"
        }
      },
    },
    highlight_git = true,            -- Highlight Git changes
    highlight_opened_files = "icon", -- Highlight opened files using their icon
    indent_markers = {
      enable = true,                 -- Enable indent lines
      icons = {
        corner = "└ ",
        edge = "│ ",
        item = "│ ",
        bottom = "─",
        none = "  ",
      },
    },
    group_empty = true, -- Group empty directories
  },
  actions = {
    open_file = {
      quit_on_open = false, -- Don't close the tree after opening a file
      window_picker = {
        enable = false,     -- Disable window picker
      },
    },
  },
  -- Key mappings for nvim-tree navigation
  on_attach = function(bufnr)
    local api = require('nvim-tree.api')
    local opts = { noremap = true, silent = true, nowait = true, buffer = bufnr }

    -- Key mappings inside nvim-tree buffer
    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts) -- Collapse folder
    vim.keymap.set('n', 'l', api.node.open.edit, opts)             -- Expand folder or open file

    -- Additional useful mappings
    vim.keymap.set('n', 'r', api.fs.rename, opts)   -- Rename file or directory
    vim.keymap.set('n', 'd', api.fs.remove, opts)   -- Delete file or directory
    vim.keymap.set('n', 'a', api.fs.create, opts)   -- Create new file or directory
    vim.keymap.set('n', 'R', api.tree.reload, opts) -- Refresh tree
  end,
})

-- Set transparent background for nvim-tree
vim.cmd([[
  hi NvimTreeNormal guibg=NONE ctermbg=NONE
  hi NvimTreeNormalNC guibg=NONE ctermbg=NONE
  hi NvimTreeEndOfBuffer guibg=NONE ctermbg=NONE
]])

-- Customize highlight for the currently focused file
vim.cmd([[
  hi NvimTreeOpenedFile guibg=#3c3836 guifg=#fbf1c7
  hi NvimTreeOpenedFileNC guibg=#3c3836 guifg=#fbf1c7
]])

-- Custom highlight colors for folders and files
vim.cmd([[
  hi NvimTreeFolderIcon guifg=#42a5f5
  hi NvimTreeFolderName guifg=#82aaff
  hi NvimTreeIndentMarker guifg=#b3afc2
]])

-- Keybindings to toggle nvim-tree and focus on the current file
vim.api.nvim_set_keymap('n', '<leader>i', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>pt', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })
