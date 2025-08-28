
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
	auto_start = false,
	log_level = "info",
	track_selection = true,
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

-- Helpful note for users (visible when editing this file):
-- If you installed Claude Code locally via the migrate-installer, ensure
-- `terminal_cmd` points at "~/.claude/local/claude" or the output of `which claude`.
