# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a LazyVim-based Neovim configuration. LazyVim is a Neovim setup framework that uses lazy.nvim for plugin management.

## Architecture

```
init.lua                    # Entry point - loads config.lazy
lua/
  config/
    lazy.lua                # lazy.nvim bootstrap and plugin loading
    options.lua             # Neovim options (indentation, scrolloff, folding, etc.)
    keymaps.lua             # Custom keymaps (loaded on VeryLazy event)
    autocmds.lua            # Custom autocommands (loaded on VeryLazy event)
  plugins/                  # Plugin specifications (auto-imported by LazyVim)
    *.lua                   # Each file returns a plugin spec table
```

## Plugin System

Plugins are defined in `lua/plugins/*.lua`. Each file exports a table (or array of tables) following the lazy.nvim plugin spec format:

```lua
return {
  "author/plugin-name",
  opts = { ... },           -- merged with defaults
  config = function() ... end,
  keys = { ... },
}
```

LazyVim extras are imported in `lua/config/lazy.lua`:
- `lazyvim.plugins.extras.linting.eslint`
- `lazyvim.plugins.extras.formatting.prettier`

## Key Plugins

- **Colorscheme**: onedark (darker style, transparent background)
- **Picker**: Telescope (set via `vim.g.lazyvim_picker = "telescope"`)
- **Completion**: blink.cmp with LSP and path sources
- **File navigation**: Harpoon 2 for quick file switching
- **AI**: Copilot, Sidekick.nvim with claudecode.nvim integration
- **Explorer**: snacks.nvim picker with hidden files enabled

## Custom Keymaps

Key bindings follow a mix of LazyVim defaults and custom mappings:

- `<leader>1-6` - Harpoon file slots
- `<C-e>` - Harpoon menu
- `<C-p>` - Git files (falls back to find_files)
- `<C-g>` - Live grep
- `<C-b>` - File browser
- `<leader>ai` / `<leader>si` - Toggle Sidekick CLI
- `<leader>gac` - AI commit
- `<leader>sr` - Search and replace word under cursor
- `<C-j>/<C-k>` - Navigation in Telescope and completion menus

## Commands

- `:Lazy` - Open lazy.nvim UI (sync, update, clean plugins)
- `:Mason` - Manage LSP servers, linters, formatters
- `:Copilot` - GitHub Copilot commands
- `:AICommit` - Generate AI-powered commit message

## Configuration Patterns

When adding new plugins:
1. Create a new file in `lua/plugins/` or add to existing file
2. Return plugin spec table with lazy.nvim format
3. Use `opts` for configuration that merges with defaults
4. Use `config` function for complex setup requiring the plugin API

When overriding LazyVim defaults, the plugin spec merges with existing configuration - only specify what needs to change.
