require('Comment').setup({
  padding = true,
  sticky = true,
  ignore = '^$',
  toggler = {
    line = 'gcc',
    block = 'gbc',
  },
  opleader = {
    line = 'gc',
    block = 'gb',
  },
  extra = {
    above = 'gcO',
    below = 'gco',
    eol = 'gcA',
  },
  mappings = {
    basic = true,
    extra = true,
  },
})

local api = require('Comment.api')
vim.keymap.set('n', '<C-_>', api.toggle.linewise.current, { noremap = true, silent = true, desc = 'Toggle comment line' })
vim.keymap.set('x', '<C-_>', function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'nx', false)
  api.toggle.linewise(vim.fn.visualmode())
end, { noremap = true, silent = true, desc = 'Toggle comment selection' })
