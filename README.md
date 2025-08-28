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
| `<leader>p`  | Paste without yanking (visual)       |
| `<leader>y`  | Yank to system clipboard             |
| `<leader>Y`  | Yank line to system clipboard        |
| `<leader>d`  | Delete without yanking               |
| `<leader>s`  | Search and replace word under cursor |
| `<leader>x`  | Make current file executable         |

### 🔍 Quick Navigation

| Keybind  | Description                    |
| -------- | ------------------------------ |
| `<C-d>`  | Scroll down half page (centered) |
| `<C-u>`  | Scroll up half page (centered)   |
| `n`      | Next search result (centered)    |
| `N`      | Previous search result (centered) |
| `J`      | Join lines (keep cursor position)|

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
| `<leader>fb` | File browser modal                         |
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
| `<C-/>` | Toggle line comment (normal mode) |
| `<C-/>` | Toggle line comment (visual mode) |

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
| `<leader>gc` | Git commit  |
| `<leader>gp` | Git push    |

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

## 🛠️ Installation & Setup

### Prerequisites

**Required Software:**
```bash
# macOS (via Homebrew)
brew install neovim git node ripgrep

# Ubuntu/Debian
sudo apt update
sudo apt install neovim git nodejs npm ripgrep

# Arch Linux
sudo pacman -S neovim git nodejs npm ripgrep
```

**Nerd Font Installation:**
```bash
# macOS - Install a Nerd Font (required for icons)
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
# Or: font-fira-code-nerd-font, font-jetbrains-mono-nerd-font

# Linux - Download and install manually from:
# https://www.nerdfonts.com/font-downloads
```

### Claude Code CLI Setup

**Install Claude Code CLI:**
```bash
# Follow official installation guide at:
# https://claude.ai/code

# After installation, verify it's available:
which claude
# Should output: /Users/yourusername/.claude/local/claude
```

### Configuration Installation

**1. Backup existing config (if any):**
```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
```

**2. Clone this configuration:**
```bash
git clone https://github.com/yourusername/nvim-config ~/.config/nvim
# OR manually copy all files to ~/.config/nvim/
```

**3. Install packer.nvim (plugin manager):**
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## 🚀 First Launch

**1. Start Neovim:**
```bash
nvim
```

**2. Install plugins:**
```vim
:PackerSync
```

**3. Restart Neovim**
```bash
# Exit and restart nvim
:q
nvim
```

**4. Install LSP servers:**
```vim
:Mason
```
*In Mason UI, install: `typescript-language-server`, `lua-language-server`, `css-lsp`, `html-lsp`, `json-lsp`, `eslint-lsp`, `gopls`*

**5. Verify Claude Code integration:**
```vim
# Open a file and try:
<leader>ac
```

## 🔧 Configuration Structure

```
~/.config/nvim/
├── init.lua                 # Main entry point
├── lua/jendis/
│   ├── init.lua            # Module loader
│   ├── packer.lua          # Plugin definitions
│   ├── set.lua             # Neovim settings
│   └── remap.lua           # Key mappings
├── after/plugin/
│   ├── alpha.lua           # Dashboard configuration
│   ├── claudecode.lua      # AI integration
│   ├── colors.lua          # Theme settings
│   ├── lsp.lua             # Language server setup
│   ├── telescope.lua       # Fuzzy finder
│   ├── treesitter.lua      # Syntax highlighting
│   └── ...                 # Other plugin configs
├── README.md               # This file
└── CLAUDE.md              # Claude Code guidance
```

## ⚠️ Troubleshooting

**Plugin installation fails:**
```vim
:PackerClean
:PackerSync
```

**LSP not working:**
```vim
:LspInfo
:Mason
```

**Claude Code not found:**
```bash
# Verify installation
which claude
ls -la ~/.claude/local/claude

# If not found, reinstall Claude Code CLI
```

**Fonts/icons not displaying:**
- Install a Nerd Font and configure your terminal to use it
- Restart terminal after font installation

**Transparent background not working:**
- Enable transparency in your terminal settings
- Some terminals require specific configuration

## 🔄 Updates

**Update plugins:**
```vim
:PackerSync
```

**Update LSP servers:**
```vim
:Mason
# Press 'U' on installed servers to update
```

**Update configuration:**
```bash
cd ~/.config/nvim
git pull origin main
```

## 💡 Development Workflow

1. **Open project**: `<leader>pf` or `<C-p>` for git files
2. **Add to AI context**: `<leader>ca` (current file) or `<leader>cd` (directory)  
3. **Start AI chat**: `<leader>ac` to toggle Claude
4. **Navigate seamlessly**: `<C-h/j/k/l>` between editor and AI
5. **Send code to AI**: Select code, press `<leader>as`
6. **Apply suggestions**: `<leader>aa` to accept, `<leader>ad` to deny

Perfect for React/TypeScript development with AI-powered coding assistance!
