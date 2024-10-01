
require('telescope').setup {
  extensions = {
    file_browser = {
      -- Optional settings
      hijack_netrw = true,  -- Optionally disable netrw when opening file browser
    },
  },
}

-- Load the extension
require('telescope').load_extension('file_browser')

-- Keymap to open the file browser in the current file's directory
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope file_browser path=%:p:h<CR>', { noremap = true, silent = true })
