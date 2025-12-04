# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal Neovim configuration for React/TypeScript development using lazy.nvim plugin manager. Features triple AI integration (Copilot inline + Copilot CLI + Sidekick), LSP support, and modern UI components.

## Architecture

```
init.lua                    # Entry point - loads config/ then plugins/
├── lua/config/             # Core configuration
│   ├── init.lua            # Loads modules, sets leader key (<Space>)
│   ├── options.lua         # Neovim settings
│   ├── keymaps.lua         # Key mappings
│   └── autocmds.lua        # Autocommands
├── lua/plugins/            # Plugin specs for lazy.nvim (what to install)
│   ├── init.lua            # Bootstraps lazy.nvim
│   ├── lsp.lua             # LSP + Mason plugins
│   ├── ai.lua              # Copilot, Sidekick, Snacks
│   └── *.lua               # Other plugin categories
└── after/plugin/           # Detailed plugin configs (how to configure)
    ├── lsp.lua             # LSP server setup & keymaps
    ├── colors.lua          # Theme customization (Czech comments)
    └── *.lua               # Other plugin configs
```

**Key pattern**: Plugin specs in `lua/plugins/` define what to install with lazy.nvim. Detailed configuration lives in `after/plugin/` for post-load setup.

## Common Commands

```bash
# Update plugins
:Lazy sync

# Check plugin load times
:Lazy profile

# Install/manage LSP servers
:Mason

# Check LSP status
:LspInfo

# Reload config
:source %   # or <leader><leader>

# Check sidekick AI integration
:checkhealth sidekick
```

## Key Configuration Files

| File | Purpose |
|------|---------|
| `lua/config/options.lua` | Neovim settings (line numbers, tabs, undo) |
| `lua/config/keymaps.lua` | Global key mappings |
| `after/plugin/lsp.lua` | LSP servers, capabilities, keymaps (gd, gr, K, etc.) |
| `after/plugin/colors.lua` | Theme configuration with transparency support |
| `after/plugin/conform.lua` | Formatters (ESLint + Prettier) |

## Adding New Functionality

**New plugin**: Create or edit file in `lua/plugins/`, add lazy.nvim spec. Detailed config goes in `after/plugin/`.

**New LSP server**: Add to `ensure_installed` in `after/plugin/lsp.lua`, configure in `servers` table.

**New keymap**: Add to `lua/config/keymaps.lua` or relevant plugin config in `after/plugin/`.

**New formatter**: Edit `after/plugin/conform.lua`, add formatter to `formatters_by_ft`.

## LSP Servers Configured

ts_ls, lua_ls, cssls, html, jsonls, eslint, tailwindcss, gopls - auto-installed via Mason.

## Dependencies

- Neovim >= 0.11.2
- Git, Node.js, ripgrep, tmux
- Nerd Font for icons

## Notes

- Leader key is `<Space>`
- `after/plugin/colors.lua` uses Czech language comments (author preference)
- Transparency support is enabled for terminal backgrounds
- Format on save is enabled with 1000ms timeout
