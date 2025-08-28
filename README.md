# 🚀 Modern Neovim Configuration

Personal Neovim configuration focused on React/TypeScript development with beautiful UI, efficient workflows, and AI integration.

## ⌨️ Key Mappings

### 🎯 General

| Keybind            | Description         |
| ------------------ | ------------------- |
| `<Space>`          | Leader key          |
| `<C-s>`            | Save file           |
| `<C-a>`            | Select all          |
| `<leader>q`        | Quit                |
| `<leader><leader>` | Source current file |
| `<leader>cr`       | Copy relative path to clipboard |

### 📑 Buffer Navigation

| Keybind | Description          |
| ------- | -------------------- |
| `<C-h>` | Move to left window  |
| `<C-j>` | Move to window below |
| `<C-k>` | Move to window above |
| `<C-l>` | Move to right window |

**Enhanced Navigation:**
- Works from **terminal mode**, **visual mode**, and **normal mode**
- `<Esc><Esc>` - Exit terminal mode
- `<leader>ct` - Quick return to terminal and enter insert mode

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

### 🔧 LSP (Language Server Protocol)

**Navigation & Information:**
| Keybind       | Description            |
| ------------- | ---------------------- |
| `gd`          | Go to definition       |
| `gi`          | Go to implementation   |
| `gr`          | Go to references       |
| `K`           | Show hover information |
| `<leader>vws` | Workspace symbol       |
| `<C-h>` (insert) | Signature help      |

**Diagnostics:**
| Keybind       | Description            |
| ------------- | ---------------------- |
| `<leader>vd`  | Show diagnostics float |
| `[d`          | Previous diagnostic    |
| `]d`          | Next diagnostic        |

**Code Actions:**
| Keybind       | Description            |
| ------------- | ---------------------- |
| `<leader>vca` | Code action            |
| `<leader>vrn` | Rename symbol          |
| `<leader>f`   | Format code            |

**Autocompletion:**
| Keybind    | Description              |
| ---------- | ------------------------ |
| `<C-k>`    | Select previous item     |
| `<C-j>`    | Select next item         |
| `<C-Space>`| Trigger completion       |
| `<C-e>`    | Abort completion         |
| `<CR>`     | Confirm selection        |

### 🤖 Claude Code Integration

**Core Commands:**
| Keybind      | Description                        |
| ------------ | ---------------------------------- |
| `<leader>ac` | Toggle Claude Code terminal        |
| `<leader>af` | Focus Claude Code terminal         |
| `<leader>as` | Send selection to Claude (visual)  |
| `<leader>ab` | Add current buffer to context      |

**Context Management:**
| Keybind      | Description                        |
| ------------ | ---------------------------------- |
| `<leader>ca` | Add current file to context        |
| `<leader>cd` | Add current directory to context   |
| `<leader>cb` | Add file + send entire buffer      |
| `<leader>cl` | Add file + send current line       |

**Diff Controls:**
| Keybind      | Description                        |
| ------------ | ---------------------------------- |
| `<leader>aa` | Accept Claude's proposed changes   |
| `<leader>ad` | Deny Claude's proposed changes     |
| `<leader>am` | Select Claude model               |

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

### 🚀 Modern Development Stack
- 🎯 **LSP Integration**: TypeScript, React, CSS, HTML, JSON, ESLint, Go support
- 🤖 **AI Integration**: Claude Code with real-time selection tracking
- ⚡ **Smart Autocompletion**: Context-aware suggestions with snippets
- 🔧 **Auto-formatting**: ESLint auto-fix on save + Prettier integration

### 🎨 Beautiful UI
- 🌈 **Transparent Background**: Terminal-friendly transparency
- 🎯 **Alpha Dashboard**: Beautiful startup screen
- 📊 **Lualine Status**: Informative status line
- 🌳 **Neo-tree Explorer**: Modern file navigation

### ⚡ Efficient Workflows
- 🔍 **Telescope Integration**: Fuzzy finding everything
- 📌 **Harpoon Navigation**: Quick file jumping
- 💭 **Smart Comments**: Context-aware commenting
- 🏷️ **Auto Tags**: HTML/JSX tag completion
- 📝 **Todo Highlighting**: TODO/FIXME/NOTE comments
- 🔄 **Visual Undo Tree**: History visualization

### 🤖 AI-Powered Development
- 🎯 **Selection Tracking**: Claude sees your selections in real-time
- 🚀 **Auto-start**: Claude launches automatically when needed
- 📂 **Context Management**: Smart file and directory context
- 🔄 **Seamless Navigation**: Switch between editor and AI chat
- ✨ **Diff Integration**: Accept/deny AI suggestions

## 📦 Dependencies

### Required
- **Neovim** >= 0.9.0
- **Git**
- **Node.js** (for LSP servers)
- **ripgrep** (for Telescope search)
- **A Nerd Font** (for icons)

### Language Servers (Auto-installed via Mason)
- `ts_ls` - TypeScript/JavaScript
- `lua_ls` - Lua  
- `cssls` - CSS
- `html` - HTML
- `jsonls` - JSON
- `eslint` - ESLint
- `gopls` - Go

### AI Integration
- **Claude Code CLI** - Installed at `~/.claude/local/claude`
- **Snacks.nvim** - Terminal provider for floating windows

## 🚀 Quick Start

1. Install dependencies
2. Launch Neovim
3. Run `:PackerSync` to install plugins
4. Run `:Mason` to install LSP servers
5. Start coding with AI assistance via `<leader>ac`

## 💡 Development Workflow

1. **Open project**: `<leader>pf` or `<C-p>` for git files
2. **Add to AI context**: `<leader>ca` (current file) or `<leader>cd` (directory)  
3. **Start AI chat**: `<leader>ac` to toggle Claude
4. **Navigate seamlessly**: `<C-h/j/k/l>` between editor and AI
5. **Send code to AI**: Select code, press `<leader>as`
6. **Apply suggestions**: `<leader>aa` to accept, `<leader>ad` to deny

Perfect for React/TypeScript development with AI-powered coding assistance!
