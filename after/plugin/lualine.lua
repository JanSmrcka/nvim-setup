-- Setup lualine
require('lualine').setup {
  options = {
    theme = {
      normal = {
        a = { fg = '#ffffff', bg = '#005f87', gui = 'bold' }, -- Normal mode color
        b = { fg = '#ffffff', bg = '#2c2c2c' },
        c = { fg = '#c0c0c0', bg = '#1c1c1c' },
      },
      insert = {
        a = { fg = '#ffffff', bg = '#00af00', gui = 'bold' }, -- Insert mode color
        b = { fg = '#ffffff', bg = '#2c2c2c' },
        c = { fg = '#c0c0c0', bg = '#1c1c1c' },
      },
      visual = {
        a = { fg = '#ffffff', bg = '#d7af00', gui = 'bold' }, -- Visual mode color
        b = { fg = '#ffffff', bg = '#2c2c2c' },
        c = { fg = '#c0c0c0', bg = '#1c1c1c' },
      },
      replace = {
        a = { fg = '#ffffff', bg = '#d7005f', gui = 'bold' }, -- Replace mode color
        b = { fg = '#ffffff', bg = '#2c2c2c' },
        c = { fg = '#c0c0c0', bg = '#1c1c1c' },
      },
      command = {
        a = { fg = '#ffffff', bg = '#5f00af', gui = 'bold' }, -- Command-line mode color
        b = { fg = '#ffffff', bg = '#2c2c2c' },
        c = { fg = '#c0c0c0', bg = '#1c1c1c' },
      },
      inactive = {
        a = { fg = '#c0c0c0', bg = '#1c1c1c', gui = 'bold' },
        b = { fg = '#c0c0c0', bg = '#2c2c2c' },
        c = { fg = '#c0c0c0', bg = '#1c1c1c' },
      },
    },
    section_separators = { left = '', right = '' }, -- Fancy section separators
    component_separators = { left = '', right = '' }, -- Fancy component separators
    icons_enabled = true, -- Enable icons for a fancier look
  },
  sections = {
    lualine_a = { 'mode' }, -- Mode will have different colors based on the current mode
    lualine_b = {
      'branch',
      'diff',
      {
        'b:gitsigns_blame_line',
        cond = function()
          local ok, blame = pcall(function()
            return vim.b.gitsigns_blame_line
          end)
          return ok and blame ~= nil
        end,
      }
    },
    lualine_c = {
      {
        'filename',
        path = 1, -- Show relative file path
        symbols = { modified = ' ●', readonly = ' ' }, -- Add icons for modified/readonly
      },
    },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'fugitive' }
}
