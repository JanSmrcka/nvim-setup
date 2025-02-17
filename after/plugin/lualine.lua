-- Setup lualine
require('lualine').setup {
  options = {
    theme = {
      normal = {
        a = { fg = '#1E1E2E', bg = '#89B4FA', gui = 'bold' }, -- Tmavý text na modré
        b = { fg = '#CDD6F4', bg = '#313244' },
        c = { fg = '#CDD6F4', bg = '#1E1E2E' },
      },
      insert = {
        a = { fg = '#1E1E2E', bg = '#A6E3A1', gui = 'bold' }, -- Tmavý text na zelené
        b = { fg = '#CDD6F4', bg = '#313244' },
        c = { fg = '#CDD6F4', bg = '#1E1E2E' },
      },
      visual = {
        a = { fg = '#1E1E2E', bg = '#F5C2E7', gui = 'bold' }, -- Tmavý text na růžové
        b = { fg = '#CDD6F4', bg = '#313244' },
        c = { fg = '#CDD6F4', bg = '#1E1E2E' },
      },
      replace = {
        a = { fg = '#1E1E2E', bg = '#F38BA8', gui = 'bold' }, -- Tmavý text na červené
        b = { fg = '#CDD6F4', bg = '#313244' },
        c = { fg = '#CDD6F4', bg = '#1E1E2E' },
      },
      command = {
        a = { fg = '#1E1E2E', bg = '#FAB387', gui = 'bold' }, -- Tmavý text na oranžové
        b = { fg = '#CDD6F4', bg = '#313244' },
        c = { fg = '#CDD6F4', bg = '#1E1E2E' },
      },
      inactive = {
        a = { fg = '#CDD6F4', bg = '#1E1E2E', gui = 'bold' },
        b = { fg = '#CDD6F4', bg = '#1E1E2E' },
        c = { fg = '#CDD6F4', bg = '#1E1E2E' },
      },
    },
    section_separators = { left = '', right = '' }, -- Fancy section separators
    component_separators = { left = '', right = '' }, -- Fancy component separators
    disabled_filetypes = { 'neo-tree', 'NvimTree', 'Outline' }, -- Zjednodušená verze
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
