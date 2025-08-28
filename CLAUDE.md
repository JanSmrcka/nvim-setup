# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal Neovim configuration focused on modern development with a beautiful UI and efficient workflows. The configuration is written in Lua and uses Packer.nvim for plugin management.

## Architecture

### Core Structure
- **init.lua**: Main entry point that loads all configuration modules and handles startup behavior (Alpha dashboard)
- **lua/jendis/**: Core configuration modules
  - `packer.lua`: Plugin definitions and management using packer.nvim
  - `set.lua`: Neovim options and settings (tabs, indentation, UI preferences)
  - `remap.lua`: Custom key mappings and leader key bindings
  - `init.lua`: Module loader
- **after/plugin/**: Plugin-specific configurations that load after plugins are initialized

### Plugin Architecture
The configuration follows a modular approach where each plugin has its own configuration file in `after/plugin/`:
- LSP setup with Mason, nvim-lspconfig, and lsp-zero
- Telescope for fuzzy finding and file navigation
- Neo-tree for file exploration
- Treesitter for syntax highlighting
- Harpoon for quick file navigation
- Git integration with Fugitive and Gitsigns
- UI enhancements with Lualine and Alpha dashboard

### Key Design Patterns
- **Transparent background**: All UI elements configured for terminal transparency
- **Space as leader key**: All custom mappings use space as the leader
- **Modular plugin loading**: Each plugin isolated in its own configuration file
- **Git-centric workflow**: Heavy integration with Git tools and shortcuts

## Common Development Commands

### Plugin Management
```bash
# Update plugins (run from within Neovim)
:PackerSync
:PackerUpdate
:PackerInstall

# Compile plugin configurations
:PackerCompile
```

### LSP and Development Tools
```bash
# Install/update language servers (run from within Neovim)
:Mason

# Update Treesitter parsers
:TSUpdate

# Format current buffer
<leader>f  # or :lua vim.lsp.buf.format()
```

### Configuration Management
```bash
# Reload configuration (from within Neovim)
<leader><leader>  # Sources the current file

# Navigate to plugin configuration
# Edit after/plugin/<plugin-name>.lua for plugin-specific settings
# Edit lua/jendis/packer.lua for plugin definitions
```

## Key Configuration Details

### Color Scheme Management
- Default theme: Tokyo Night
- Supports multiple themes: Rose Pine, Tokyo Night, Mellow, Solarized Osaka, OneDark Pro, VSCode
- Transparent background enabled by default in `after/plugin/colors.lua`
- Change theme by editing the `ColorMyPencil()` function parameter

### Plugin Dependencies
- Uses Packer.nvim for plugin management
- All plugins defined in `lua/jendis/packer.lua` with Czech comments
- Mason handles LSP server installations
- Telescope requires ripgrep for file searching
- Neo-tree replaces netrw (netrw is disabled in init.lua)

### Critical Settings
- **Leader key**: Space (set in both init.lua and remap.lua)
- **Indentation**: 2 spaces, expandtab enabled
- **Undo**: Persistent undo files stored in `~/.vim/undodir`
- **Line numbers**: Relative numbering enabled
- **Auto-reload**: Files automatically reload on focus/buffer changes

### File Structure Conventions
- Plugin configurations use descriptive Czech comments
- Each plugin has isolated configuration in `after/plugin/`
- Key mappings centralized in `lua/jendis/remap.lua`
- Global settings in `lua/jendis/set.lua`

## Important Notes

- Netrw is explicitly disabled - use Neo-tree for file management
- Configuration includes GitHub Copilot integration
- Alpha dashboard shows on startup and when entering directories
- Transparent terminal background is enforced across all UI elements
- Git integration is extensive with Fugitive and Gitsigns