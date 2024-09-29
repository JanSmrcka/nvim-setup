require('lualine').setup {
  options = {
    theme = {
      normal = {
        a = { fg = '#ffffff', bg = '#005f87', gui = 'bold' },  -- Normal mode color
      },
      insert = {
        a = { fg = '#ffffff', bg = '#00af00', gui = 'bold' },  -- Insert mode color
      },
      visual = {
        a = { fg = '#ffffff', bg = '#d7af00', gui = 'bold' },  -- Visual mode color
      },
      replace = {
        a = { fg = '#ffffff', bg = '#d7005f', gui = 'bold' },  -- Replace mode color
      },
      command = {
        a = { fg = '#ffffff', bg = '#5f00af', gui = 'bold' },  -- Command-line mode color
      },
    },
    section_separators = '',
    component_separators = '',
  },
  sections = {
    lualine_a = {'mode'},  -- Mode will have different colors based on the current mode
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}
