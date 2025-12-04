-- Autocommands
-- Alpha dashboard startup logic migrated from init.lua

-- Function to show Alpha
local function show_alpha()
  -- Delete all buffers
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    pcall(vim.api.nvim_buf_delete, bufnr, { force = true })
  end
  vim.cmd("Alpha")
end

-- Handle startup - show Alpha on empty launch
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("StartupGroup", { clear = true }),
  callback = function()
    -- Get current buffer info
    local current_buf = vim.api.nvim_get_current_buf()
    local buf_name = vim.api.nvim_buf_get_name(current_buf)

    -- Check if the buffer name is a directory
    local is_directory = vim.fn.isdirectory(buf_name) == 1

    -- Show Alpha if:
    -- 1. No arguments (empty startup)
    -- 2. Current buffer is a directory
    if vim.fn.argc() == 0 or is_directory then
      vim.schedule(function()
        show_alpha()
      end)
    end
  end,
})

-- Additional safeguard - show Alpha when entering a directory
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("DirectoryGroup", { clear = true }),
  callback = function()
    local buf_name = vim.api.nvim_buf_get_name(0)
    if vim.fn.isdirectory(buf_name) == 1 then
      vim.schedule(function()
        show_alpha()
      end)
      return true
    end
  end,
})
