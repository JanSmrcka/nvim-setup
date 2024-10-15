-- Load the telescope module and configure it
local telescope = require('telescope')

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = require('telescope.actions').move_selection_next,     -- Move to the next item
        ['<C-k>'] = require('telescope.actions').move_selection_previous, -- Move to the previous item
      },
      n = {
        ['<C-j>'] = require('telescope.actions').move_selection_next,
        ['<C-k>'] = require('telescope.actions').move_selection_previous,
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",  -- Makes it look like a modal window
      hijack_netrw = true, -- Replaces netrw with file-browser
      -- Other configurations if necessary
    },
  },
})

-- Load the file_browser extension
require('telescope').load_extension('file_browser')

-- Map a key to open the file browser in a modal window
vim.api.nvim_set_keymap(
  'n',
  '<leader>fb',
  ':Telescope file_browser<CR>',
  { noremap = true, silent = true }
)


vim.cmd([[
  hi TelescopeNormal guibg=NONE ctermbg=NONE
  hi TelescopeBorder guibg=NONE ctermbg=NONE
  hi TelescopePromptNormal guibg=NONE ctermbg=NONE
  hi TelescopeResultsNormal guibg=NONE ctermbg=NONE
  hi TelescopePromptBorder guibg=NONE ctermbg=NONE
  hi TelescopeResultsBorder guibg=NONE ctermbg=NONE
  hi TelescopePreviewBorder guibg=NONE ctermbg=NONE

  hi TelescopeNormal guifg=#d1d5db
  hi TelescopeSelection guifg=#1f2937 guibg=#65a30d
  hi TelescopeResultsNormal guifg=#d1d5db
  hi TelescopeResultsTitle guifg=#d1d5db
  hi TelescopePromptTitle guifg=#d1d5db
]])


-- Load telescope built-in functions for key mappings
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
