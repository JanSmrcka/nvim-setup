# 🚀 Modern Neovim Configuration

Personal Neovim configuration focused on React/TypeScript development with beautiful UI, efficient workflows, and **triple AI integration** (Copilot inline + Copilot CLI + Sidekick) powered by **lazy.nvim**.

## ✨ What's New

- 🔄 **Migrated to lazy.nvim** - Modern plugin manager with lazy loading
- 🤖 **Sidekick.nvim** - Enhanced AI integration with tmux support
- 💬 **GitHub Copilot CLI** - Natural language AI conversations in terminal
- 📁 **Modular Structure** - Organized config and plugin files
- ⚡ **Faster Startup** - Optimized plugin loading
- 🎯 **Triple AI Setup** - Copilot inline + Copilot CLI + Sidekick integration

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

### 📝 Text Manipulation

| Keybind      | Description                          |
| ------------ | ------------------------------------ |
| `J` (visual) | Move selected lines down             |
| `K` (visual) | Move selected lines up               |
| `<leader>p`  | Paste without yanking (visual)       |
| `<leader>y`  | Yank to system clipboard             |
| `<leader>Y`  | Yank line to system clipboard        |
| `<leader>d`  | Delete without yanking               |
| `<leader>sr` | Search and replace word under cursor |
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
| `<leader>ff` | Find files                                 |
| `<leader>fg` | Live grep                                  |
| `<leader>fb` | Buffers                                    |
| `<leader>fh` | Help tags                                  |

**Telescope Actions (within picker):**
| Keybind | Description                    |
| ------- | ------------------------------ |
| `<C-q>` | Send all results to quickfix list |
| `<C-j>` | Move to next item              |
| `<C-k>` | Move to previous item          |

### 📌 Harpoon

| Keybind     | Description         |
| ----------- | ------------------- |
| `<leader>a` | Add file to harpoon |
| `<C-e>`     | Toggle quick menu   |

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
| `<leader>fm`  | Format code            |

**Autocompletion:**
| Keybind    | Description              |
| ---------- | ------------------------ |
| `<C-k>`    | Select previous item     |
| `<C-j>`    | Select next item         |
| `<C-Space>`| Trigger completion       |
| `<C-e>`    | Abort completion         |
| `<CR>`     | Confirm selection        |

### 🤖 AI Integration (Sidekick.nvim)

#### Next Edit Suggestions (NES)
| Keybind    | Description                          |
| ---------- | ------------------------------------ |
| `<Tab>`    | Goto/Apply Next Edit Suggestion      |

#### CLI Terminal Control
| Keybind      | Description                        |
| ------------ | ---------------------------------- |
| `<leader>aa` | Toggle AI CLI terminal (tmux pane) |
| `<Ctrl-.>`   | Toggle Sidekick (all modes)        |
| `<leader>as` | Select AI tool (Claude, Copilot, etc.) |
| `<leader>ad` | Detach/Close CLI session           |

#### Context & Prompts
| Keybind      | Description                        |
| ------------ | ---------------------------------- |
| `<leader>at` | Send current context               |
| `<leader>ap` | Open prompt selector               |
| `<leader>af` | Send entire file                   |
| `<leader>av` | Send visual selection (visual mode)|

#### GitHub Copilot (Inline)
| Keybind    | Description                          |
| ---------- | ------------------------------------ |
| `Alt+]`    | Next Copilot suggestion              |
| `Alt+[`    | Previous Copilot suggestion          |
| `Ctrl+]`   | Dismiss Copilot suggestion           |

### 💭 Comments

| Keybind | Description                       |
| ------- | --------------------------------- |
| `gc`    | Toggle line comment (normal mode) |
| `gc`    | Toggle line comment (visual mode) |
| `gb`    | Toggle block comment              |

### 📝 Todo Comments

| Keybind      | Description           |
| ------------ | --------------------- |
| `]t`         | Next todo comment     |
| `[t`         | Previous todo comment |

### 🌳 Git

**Git Operations (Fugitive):**
| Keybind       | Description |
| ------------- | ----------- |
| `<leader>gs`  | Git status  |
| `<leader>gac` | AI Commit with auto-generated message |

**Git Navigation & Actions (Gitsigns):**
| Keybind      | Description                    |
| ------------ | ------------------------------ |
| `]c`         | Next git change                |
| `[c`         | Previous git change            |
| `<leader>gb` | Toggle git blame               |
| `<leader>gh` | Preview hunk                   |
| `<leader>gr` | Reset hunk                     |
| `<leader>gd` | Git diff                       |

### 🔄 Quickfix List

| Keybind     | Description                |
| ----------- | -------------------------- |
| `<M-j>`     | Next quickfix item         |
| `<M-k>`     | Previous quickfix item     |
| `<leader>j` | Next location list item    |
| `<leader>k` | Previous location list item|

### 🌳 File Explorer (Neo-tree)

| Keybind      | Description                |
| ------------ | -------------------------- |
| `<leader>e`  | Toggle Neo-tree            |

### 🔄 Undo

| Keybind     | Description     |
| ----------- | --------------- |
| `<leader>u` | Toggle undotree |

## 🎨 Features

### 🚀 Modern Development Stack
- 🎯 **LSP Integration**: TypeScript, React, CSS, HTML, JSON, ESLint, Go support
- 🤖 **Dual AI Integration**: GitHub Copilot (inline) + Sidekick (CLI tools)
- ⚡ **Smart Autocompletion**: Context-aware suggestions with snippets
- 🔧 **Auto-formatting**: Conform.nvim with ESLint & Prettier

### 🎨 Beautiful UI
- 🌈 **Transparent Background**: Terminal-friendly transparency
- 🎯 **Alpha Dashboard**: Beautiful startup screen with plugin count
- 📊 **Lualine Status**: Informative status line
- 🌳 **Neo-tree Explorer**: Modern file navigation
- 💬 **Noice.nvim**: Enhanced command line and notifications

### ⚡ Efficient Workflows
- 🔍 **Telescope Integration**: Fuzzy finding everything
- 📌 **Harpoon Navigation**: Quick file jumping
- 💭 **Smart Comments**: Context-aware commenting
- 🏷️ **Auto Tags**: HTML/JSX tag completion
- 📝 **Todo Highlighting**: TODO/FIXME/NOTE comments
- 🔄 **Visual Undo Tree**: History visualization

### 🤖 AI-Powered Development (Triple AI Setup)
- ⚡ **Inline Suggestions**: GitHub Copilot for instant code completions
- 💬 **Copilot CLI**: Natural language conversations in terminal
- 🎯 **Sidekick.nvim**: Multiple AI tool integration (Claude, Copilot CLI, etc.)
- 🖥️ **Tmux Integration**: AI CLI runs in separate tmux pane
- 📂 **Context Management**: Send files, selections, or current context to AI
- 🔄 **Next Edit Suggestions**: AI-powered code modifications with Tab navigation
- ✨ **Prompt Library**: Pre-configured prompts for common tasks

## 📦 Dependencies

### Required
- **Neovim** >= 0.11.2 (for sidekick.nvim)
- **Git**
- **Node.js** (for LSP servers)
- **ripgrep** (for Telescope search)
- **tmux** (for sidekick CLI integration)
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
- **GitHub Copilot** - Sign in via `:Copilot auth`
- **Copilot LSP** - For sidekick.nvim (`:LspCopilotSignIn`)
- **GitHub Copilot CLI** - Install via `npm install -g @github/copilot`
- **Snacks.nvim** - UI components and terminal provider

## 🛠️ Installation & Setup

### Prerequisites

**Required Software:**
```bash
# macOS (via Homebrew)
brew install neovim git node ripgrep tmux

# Ubuntu/Debian
sudo apt update
sudo apt install neovim git nodejs npm ripgrep tmux

# Arch Linux
sudo pacman -S neovim git nodejs npm ripgrep tmux
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

### Configuration Installation

**1. Backup existing config (if any):**
```bash
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup
```

**2. Clone this configuration:**
```bash
git clone https://github.com/JanSmrcka/nvim-config ~/.config/nvim
# OR manually copy all files to ~/.config/nvim/
```

**3. No manual plugin manager installation needed!**
```
Lazy.nvim bootstraps itself automatically on first launch
```

## 🚀 First Launch

**1. Start Neovim:**
```bash
nvim
```
*Lazy.nvim will automatically install all plugins on first launch*

**2. Wait for installation to complete**
- You'll see a progress window
- Treesitter parsers will compile
- Press `q` when done

**3. Restart Neovim**
```bash
:q
nvim
```

**4. Install LSP servers:**
```vim
:Mason
```
*In Mason UI, install: `typescript-language-server`, `lua-language-server`, `css-lsp`, `html-lsp`, `json-lsp`, `eslint-lsp`, `gopls`*

**5. Install GitHub Copilot CLI:**
```bash
# Requires Node.js v22+ and npm v10+
npm install -g @github/copilot

# Verify installation
copilot --version
```

**6. Setup AI integrations:**
```vim
# Authenticate GitHub Copilot (inline suggestions):
:Copilot auth

# Sign in to Copilot LSP (for sidekick):
:LspCopilotSignIn

# Verify sidekick setup:
:checkhealth sidekick
```

**7. Configure Copilot CLI (first time):**
```bash
# Start Copilot CLI
copilot

# Inside CLI, login:
/login

# Follow on-screen instructions to authenticate
```

**8. Test Sidekick integration:**
```vim
# In Neovim, try opening AI CLI:
<leader>aa

# Select GitHub Copilot CLI as your tool:
<leader>as

# Send current context:
<leader>at
```

## 🔧 Configuration Structure

```
~/.config/nvim/
├── init.lua                 # Main entry point
├── lua/
│   ├── config/
│   │   ├── init.lua        # Config loader
│   │   ├── options.lua     # Neovim settings
│   │   ├── keymaps.lua     # Key mappings
│   │   └── autocmds.lua    # Autocommands (Alpha startup)
│   └── plugins/
│       ├── init.lua        # Lazy.nvim bootstrap
│       ├── colorschemes.lua # Theme plugins
│       ├── telescope.lua   # Fuzzy finder
│       ├── neo-tree.lua    # File explorer
│       ├── treesitter.lua  # Syntax highlighting
│       ├── lsp.lua         # Language servers
│       ├── ui.lua          # Lualine, Alpha, Noice
│       ├── git.lua         # Fugitive, Gitsigns
│       ├── editor.lua      # Harpoon, Undotree, etc.
│       ├── formatting.lua  # Conform.nvim
│       ├── ai.lua          # Sidekick, Copilot, Snacks
│       ├── comments.lua    # Comment plugins
│       └── markdown.lua    # Markdown rendering
├── after/plugin/           # Plugin configurations
│   ├── alpha.lua           # Dashboard setup
│   ├── colors.lua          # Theme settings
│   ├── lsp.lua             # LSP configuration
│   ├── telescope.lua       # Telescope setup
│   ├── treesitter.lua      # Treesitter config
│   └── ...                 # Other configs
└── README.md               # This file
```

## ⚠️ Troubleshooting

**Plugin installation fails:**
```vim
:Lazy restore
:Lazy sync
```

**LSP not working:**
```vim
:LspInfo
:Mason
```

**Sidekick not working:**
```vim
:checkhealth sidekick
:LspCopilotSignIn
```

**Tmux pane not opening:**
```bash
# Verify you're running inside tmux:
echo $TMUX

# If not in tmux, start tmux first:
tmux
nvim
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
:Lazy update
:Lazy sync
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
nvim  # Lazy will auto-update plugins
```

**Clean unused plugins:**
```vim
:Lazy clean
```

## 💡 Development Workflow

### 🚀 AI-Enhanced Development Flow

1. **Start in tmux**: `tmux` (if not already)
2. **Open Neovim**: `nvim` in your project
3. **Find files**: `<leader>ff` for fuzzy file search
4. **Inline AI coding**: Start typing - Copilot provides suggestions (accept with `Tab`)
5. **Complex AI tasks**: `<leader>aa` to open Sidekick CLI in tmux pane
6. **Select AI tool**: `<leader>as` to choose Claude, Copilot, or other tools
7. **Send context**:
   - `<leader>at` - Send current code context
   - `<leader>af` - Send entire file
   - Select code in visual mode, then `<leader>av` - Send selection
8. **Use prompts**: `<leader>ap` for pre-configured prompts
9. **Navigate seamlessly**: `<C-h/j/k/l>` between editor and AI pane

### 🎯 Triple AI Power
- **GitHub Copilot (inline)**: Instant completions while typing - accept with `Tab`
- **GitHub Copilot CLI**: Natural language conversations in terminal via Sidekick
- **Sidekick.nvim**: Multiple AI tool integration (Claude, Copilot CLI, etc.)
- **Tmux integration**: AI runs in separate pane, doesn't block your editor

### 🔥 Quick Tips

**Lazy.nvim commands:**
- `:Lazy` - Open plugin manager UI
- `:Lazy update` - Update all plugins
- `:Lazy sync` - Install missing + update + clean
- `:Lazy profile` - See plugin load times

**Alpha dashboard shortcuts:**
- `n` - New file
- `f` - Find file (Telescope)
- `r` - Recent files
- `p` - Update plugins (Lazy sync)
- `q` - Quit

**AI workflow:**
1. Code with Copilot inline suggestions
2. Need help? `<leader>aa` → opens Sidekick
3. Choose tool: `<leader>as` (select "GitHub Copilot CLI")
4. Send context: `<leader>at` or `<leader>af`
5. Get AI response in tmux pane
6. Close when done: `<leader>ad`

**GitHub Copilot CLI commands:**
- `/help` - Show available commands
- `/login` - Authenticate with GitHub
- `/exit` - Exit Copilot CLI
- Ask anything directly in natural language!

**Example workflow with Copilot CLI:**
```
# In Neovim:
<leader>aa           # Open Sidekick
<leader>as           # Select "GitHub Copilot CLI"
<leader>at           # Send current function/class

# In tmux pane (Copilot CLI):
How can I optimize this code?
What are potential bugs here?
Explain this algorithm step by step
```

Perfect for React/TypeScript development with modern tooling and **triple AI assistance** (inline + CLI + chat)! 🚀

---

## 📝 Migration Notes (for existing users)

**From Packer to Lazy.nvim:**
- ✅ All plugins migrated
- ✅ Lazy loading optimized
- ✅ Faster startup time
- ❌ Packer removed

**Key changes:**
- Commands: `:PackerSync` → `:Lazy sync`
- Structure: `lua/jendis/` → `lua/config/` + `lua/plugins/`
- AI: `claudecode.nvim` → `sidekick.nvim` (more flexible)
- Plugin count shown in Alpha dashboard now uses lazy.nvim API

**Clean installation recommended:**
```bash
# Backup first!
mv ~/.local/share/nvim ~/.local/share/nvim.backup
# Then launch nvim - everything reinstalls cleanly
```
