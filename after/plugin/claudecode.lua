
-- Simple configuration for coder/claudecode.nvim
-- Matches README suggestions: detect local `claude` binary, use snacks.nvim
-- for a floating terminal, and provide a few handy keymaps.

-- Determine the `claude` binary to use. Priority:
-- 1) user override `vim.g.claudecode_terminal_cmd`
-- 2) env var `CLAUDE_CMD`
-- 3) local binary at ~/.claude/local/claude
-- 4) fallback to searching PATH via `exepath("claude")`
local function resolve_path(p)
	if not p or p == "" then
		return nil
	end
	-- expand ~ and environment variables
	return vim.fn.expand(p)
end

local terminal_cmd = nil
-- 1) global override (set this in your init.lua before plugins load)
terminal_cmd = resolve_path(vim.g.claudecode_terminal_cmd)
-- 2) environment variable
if not terminal_cmd then
	terminal_cmd = resolve_path(vim.env.CLAUDE_CMD or os.getenv("CLAUDE_CMD") or "")
end
-- 3) common local install path
if not terminal_cmd then
	local local_path = resolve_path("~/.claude/local/claude")
	if local_path ~= "" and vim.loop.fs_stat(local_path) then
		terminal_cmd = local_path
	end
end
-- 4) finally try PATH
if not terminal_cmd then
	local claude_path = vim.fn.exepath("claude")
	if claude_path ~= "" then
		terminal_cmd = claude_path
	end
end

local opts = {
	-- If terminal_cmd is nil the plugin will fall back to the default "claude"
	terminal_cmd = terminal_cmd,
	auto_start = true,
	log_level = "info", 
	track_selection = true,
	visual_demotion_delay_ms = 50,
	terminal = {
		split_side = "right", -- "left" or "right"
		split_width_percentage = 0.30,
		provider = "auto", -- "auto", "snacks", "native", "external", or custom provider table
		auto_close = true,
		snacks_win_opts = {}, -- Opts to pass to `Snacks.terminal.open()` - see Floating Window section below

		-- Provider-specific options
		provider_opts = {
			external_terminal_cmd = nil, -- Command template for external terminal provider (e.g., "alacritty -e %s")
		},
	},
}

-- Safe require: if the plugin isn't installed don't error out
local ok, claudecode = pcall(require, "claudecode")
if ok and claudecode then
	claudecode.setup(opts)
end

-- Keymaps: toggle, focus, send selection, add current buffer and diff controls
local function safe_map(mode, lhs, rhs, opts)
	opts = opts or {}
	-- default mapping options
	if opts.noremap == nil then
		opts.noremap = true
	end
	if opts.silent == nil then
		opts.silent = true
	end

	-- don't override existing mappings
	local ok, existing = pcall(vim.api.nvim_get_keymap, (type(mode) == 'table' and mode[1]) or mode)
	if ok and existing then
		for _, m in ipairs(existing) do
			if m.lhs == lhs then
				return
			end
		end
	end

	vim.keymap.set(mode, lhs, rhs, opts)
end

safe_map({ "n", "x" }, "<leader>ac", "<cmd>ClaudeCode<cr>", { desc = "Claude: Toggle" })
safe_map({ "n", "x" }, "<leader>af", "<cmd>ClaudeCodeFocus<cr>", { desc = "Claude: Focus" })
safe_map("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>", { desc = "Claude: Send selection" })
safe_map("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Claude: Add buffer" })
safe_map("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Claude: Accept diff" })
safe_map("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "Claude: Deny diff" })
safe_map("n", "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", { desc = "Claude: Select model" })

-- Additional context management mappings
safe_map("n", "<leader>ca", function()
  local filepath = vim.fn.expand("%:p")
  vim.cmd("ClaudeCodeAdd " .. filepath)
end, { desc = "Claude: Add current file to context" })

safe_map("n", "<leader>cd", function()
  local dirpath = vim.fn.expand("%:p:h")
  vim.cmd("ClaudeCodeAdd " .. dirpath)
end, { desc = "Claude: Add current directory to context" })

-- Use standard selection sending (relies on selection tracking)
-- Note: <leader>as is already mapped above by the standard mappings

safe_map("n", "<leader>cb", function()
  -- First add current file to context, then send entire buffer
  local filepath = vim.fn.expand("%:p")
  vim.cmd("ClaudeCodeAdd " .. filepath)
  
  vim.defer_fn(function()
    vim.cmd("normal! ggVG")
    vim.cmd("ClaudeCodeSend")
    vim.cmd("normal! <Esc>")
  end, 100)
end, { desc = "Claude: Add file to context and send buffer" })

safe_map("n", "<leader>cl", function()
  -- Add current file to context first
  local filepath = vim.fn.expand("%:p")
  vim.cmd("ClaudeCodeAdd " .. filepath)
  
  vim.defer_fn(function()
    local line = vim.api.nvim_get_current_line()
    -- Create temporary selection and send
    vim.cmd("normal! V")
    vim.cmd("ClaudeCodeSend")
    vim.cmd("normal! <Esc>")
  end, 100)
end, { desc = "Claude: Add file to context and send current line" })

-- Custom navigation mappings for terminal and visual mode
-- Terminal mode navigation shortcuts
-- Allow Ctrl+h,j,k,l to navigate between windows from terminal mode
safe_map("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to left window from terminal" })
safe_map("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to window below from terminal" })
safe_map("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to window above from terminal" })
safe_map("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to right window from terminal" })

-- Visual mode navigation shortcuts  
-- Allow Ctrl+h,j,k,l to navigate between windows from visual mode
safe_map("v", "<C-h>", "<Esc><C-w>h", { desc = "Go to left window from visual mode" })
safe_map("v", "<C-j>", "<Esc><C-w>j", { desc = "Go to window below from visual mode" })
safe_map("v", "<C-k>", "<Esc><C-w>k", { desc = "Go to window above from visual mode" })
safe_map("v", "<C-l>", "<Esc><C-w>l", { desc = "Go to right window from visual mode" })

-- Easy escape from terminal mode
safe_map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Quick return to terminal mode after navigation
safe_map("n", "<leader>ct", function()
  -- Find terminal buffer and enter terminal mode
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == 'terminal' then
      local wins = vim.fn.win_findbuf(buf)
      if #wins > 0 then
        vim.api.nvim_set_current_win(wins[1])
        vim.cmd("startinsert")
        break
      end
    end
  end
end, { desc = "Return to terminal and enter insert mode" })

-- Helpful note for users (visible when editing this file):
-- If you installed Claude Code locally via the migrate-installer, ensure
-- `terminal_cmd` points at "~/.claude/local/claude" or the output of `which claude`.
