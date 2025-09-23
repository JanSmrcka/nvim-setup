-- Setup lualine
-- Dynamické získání barev z centralizované konfigurace
local function get_lualine_theme()
  local colors = GetCurrentColors and GetCurrentColors() or {
    primary = "#61afef",
    secondary = "#c678dd",
    success = "#98c379",
    warning = "#e5c07b",
    error = "#e06c75",
    info = "#61afef",
    fg_sidebar = "#abb2bf",
    border = "#3e4451"
  }

  -- Vrátit 'auto' aby Lualine použila výchozí barvy aktuálního tématu
  return 'auto'
end

require('lualine').setup {
  options = {
    theme = get_lualine_theme(),
    section_separators = { left = '', right = '' },   -- Fancy section separators
    component_separators = { left = '', right = '' }, -- Fancy component separators
    disabled_filetypes = {
      'neo-tree',
      'NvimTree',
      'Outline',
      -- Zakázat lualine pro Avante buffery
      'avante',
      'AvanteChat',
      "AvanteChatInput",
      "AvanteChatList",
      'AvanteBuffer',
      'AvanteInput',
      'AvanteResult',
      'avante-nvim',
      'AvanteToolWindow',
      -- Obecné buffery, které mohou být používány Avante
      'DressingInput',
      'DressingSelect',
      'NoStatusLine',
    }, -- Zjednodušená verze
    -- Další způsob, jak zakázat lualine pro Avante buffery
    disabled_buftypes = { 'prompt' },
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
