# 🚀 Neovim Configuration

Personal Neovim configuration focused on modern development with beautiful UI and efficient workflows.

## ⌨️ Key Mappings

### 🎯 General

| Keybind            | Description         |
| ------------------ | ------------------- |
| `<Space>`          | Leader key          |
| `<C-s>`            | Save file           |
| `<C-a>`            | Select all          |
| `<leader>q`        | Quit                |
| `<leader><leader>` | Source current file |

### 📑 Buffer Navigation

| Keybind | Description          |
| ------- | -------------------- |
| `<C-h>` | Move to left window  |
| `<C-j>` | Move to window below |
| `<C-k>` | Move to window above |
| `<C-l>` | Move to right window |

### 📝 Text Manipulation

| Keybind      | Description                          |
| ------------ | ------------------------------------ |
| `J` (visual) | Move selected lines down             |
| `K` (visual) | Move selected lines up               |
| `<leader>p`  | Paste without yanking                |
| `<leader>y`  | Yank to system clipboard             |
| `<leader>Y`  | Yank line to system clipboard        |
| `<leader>d`  | Delete without yanking               |
| `<leader>s`  | Search and replace word under cursor |
| `<leader>x`  | Make current file executable         |

### 🔍 Telescope

| Keybind      | Description                                |
| ------------ | ------------------------------------------ |
| `<leader>pf` | Find files                                 |
| `<C-p>`      | Git files                                  |
| `<C-g>`      | Live grep                                  |
| `<leader>fh` | Help tags                                  |
| `<leader>/`  | Fuzzy find in current buffer               |
| `<leader>?`  | Show recent files                          |
| `<leader>sd` | Show diagnostics                           |
| `<C-b>`      | File browser in current buffer's directory |

### 📌 Harpoon

| Keybind       | Description              |
| ------------- | ------------------------ |
| `<leader>a`   | Add file to harpoon      |
| `<C-e>`       | Toggle quick menu        |
| `<leader>1-4` | Jump to harpoon file 1-4 |

### 🔧 LSP

| Keybind       | Description            |
| ------------- | ---------------------- |
| `gd`          | Go to definition       |
| `K`           | Show hover information |
| `<leader>vws` | Workspace symbol       |
| `<leader>vd`  | Show diagnostics float |
| `[d`          | Next diagnostic        |
| `]d`          | Previous diagnostic    |
| `<leader>vca` | Code action            |
| `<leader>vrr` | Show references        |
| `<leader>vrn` | Rename                 |
| `<C-h>`       | Signature help         |
| `<leader>f`   | Format code            |

### 💭 Comments

| Keybind | Description                       |
| ------- | --------------------------------- |
| `<C-_>` | Toggle line comment               |
| `<C-c>` | Toggle line comment (alternative) |
| `<C-/>` | Toggle line comment (alternative) |

### 📝 Todo Comments

| Keybind      | Description           |
| ------------ | --------------------- |
| `]t`         | Next todo comment     |
| `[t`         | Previous todo comment |
| `<leader>ft` | Find todos            |

### 🌳 Git

| Keybind      | Description |
| ------------ | ----------- |
| `<leader>gs` | Git status  |

### 🔄 Undo

| Keybind     | Description     |
| ----------- | --------------- |
| `<leader>u` | Toggle undotree |

## 🎨 Features

- 🎯 Modern UI with Alpha dashboard
- 🌈 Transparent background support
- 🔍 Fuzzy finding with Telescope
- 📝 LSP support with auto-completion
- 🌳 File explorer with Neo-tree
- 💭 Smart commenting
- 🔄 Undo history visualization
- ✨ Auto-formatting
- 📌 Quick file navigation with Harpoon
- 🎨 Syntax highlighting with Treesitter
- 🏷️ Auto tag closing for HTML/JSX
- 📝 Todo comments highlighting
- 🔧 Null-ls for additional formatting
- 💅 Prettier integration

## 📦 Required Dependencies

- Neovim >= 0.9.0
- Git
- A Nerd Font
- ripgrep (for Telescope)
- Node.js (for LSP)
