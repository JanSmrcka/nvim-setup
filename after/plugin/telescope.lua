-- Load the telescope module and configure it
local telescope = require('telescope')

local transform_mod = require('telescope.actions.mt').transform_mod
local actions = transform_mod({
  send_to_qflist = function(prompt_bufnr)
    require('telescope.actions').send_to_qflist(prompt_bufnr)
    require('telescope.actions').open_qflist(prompt_bufnr)
  end,
})

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = require('telescope.actions').move_selection_next,     -- Move to the next item
        ['<C-k>'] = require('telescope.actions').move_selection_previous, -- Move to the previous item
        ['<C-l>'] = require('telescope.actions').select_default,
        ['<C-q>'] = actions.send_to_qflist,
      },
      n = {
        ['<C-j>'] = require('telescope.actions').move_selection_next,
        ['<C-k>'] = require('telescope.actions').move_selection_previous,
        ['<C-l>'] = require('telescope.actions').select_default,
        ['<C-q>'] = actions.send_to_qflist,
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",  -- Makes it look like a modal window
      hijack_netrw = false,  -- Změníme na false, aby se nespouštěl automaticky
      hidden = true,
      respect_gitignore = false,
      -- Other configurations if necessary
    },
  },
})

-- Load the file_browser extension
require('telescope').load_extension('file_browser')

-- Map a key to open the file browser in a modal window
vim.api.nvim_set_keymap(
  'n',
  '<leader>pb',
  ':Telescope file_browser<CR>',
  { noremap = true, silent = true }
)


-- Telescope používá výchozí barvy tématu


-- Load telescope built-in functions for key mappings
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>?', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, {})

--vim.keymap.set("n", "<space>fb", ":Telescope file_browser<CR>")

-- open file_browser with the path of the current buffer
vim.keymap.set("n", "<C-b>", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
