local last_commit_info = ''

-- Function to run git log once when entering a buffer
local function update_last_commit_info()
  local file = vim.fn.expand('%:p') -- Full file path
  -- Run git log for the current file, but only if it's inside a git repository
  local is_git = vim.fn.system('git rev-parse --is-inside-work-tree 2>/dev/null')
  if is_git == 'true\n' then
    local commit_info = vim.fn.systemlist('git log -n 1 --pretty=format:"%an, %ad" -- ' .. file)[1]
    if commit_info and commit_info ~= '' then
      last_commit_info = ' ' .. commit_info
    else
      last_commit_info = '' -- If the file is not tracked by Git, show nothing
    end
  else
    last_commit_info = '' -- Not a git-tracked file
  end
end

-- Setup autocommand to update last commit info on file/buffer changes
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  callback = function()
    update_last_commit_info()
  end
})

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
    lualine_a = { 'mode' },           -- Mode will have different colors based on the current mode
    lualine_b = { 'branch', 'diff' }, -- Add branch and git diff information
    lualine_c = {
      {
        'filename',
        path = 1, -- Show relative file path
        symbols = { modified = ' ●', readonly = ' ' }, -- Add icons for modified/readonly
      },
      {
        function()
          return last_commit_info -- Show cached last commit info
        end,
        cond = function()
          return last_commit_info ~= '' -- Only show if there is commit info
        end,
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
