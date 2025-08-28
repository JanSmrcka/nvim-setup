-- ===================================================================
-- Neovim Plugin Management using packer.nvim
-- Tento soubor může být načten pomocí `lua require('plugins')` v init.vim
-- ===================================================================

-- Ujisti se, že packer.nvim je načten
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer sám sebe spravuje
  use 'wbthomason/packer.nvim'

  -- =======================
  -- 🔎 Telescope (Fuzzy Finder)
  -- =======================
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  -- =======================
  -- 🎨 Barevná schémata
  -- =======================
  use({ "rose-pine/neovim", as = "rose-pine" })
  use({ "folke/tokyonight.nvim", as = "tokyonight" })
  use({ "mellow-theme/mellow.nvim", as = "mellow" })
  use({ "craftzdog/solarized-osaka.nvim", as = "osaka" })
  use "olimorris/onedarkpro.nvim"
  use 'Mofiqul/vscode.nvim'

  -- =======================
  -- 📁 File Explorer (Neo-tree)
  -- =======================
  use {
    'nvim-neo-tree/neo-tree.nvim',
    requires = {
      'nvim-lua/plenary.nvim',       -- Utility knihovna
      'nvim-tree/nvim-web-devicons', -- Ikony souborů
      'MunifTanjim/nui.nvim',        -- UI komponenty
      '3rd/image.nvim',              -- Podpora náhledu obrázků
      {
        's1n7ax/nvim-window-picker',
        version = '2.*',
        config = function()
          require('window-picker').setup {
            filter_rules = {
              include_current_win = false,
              autoselect_one = true,
              bo = { filetype = { 'neo-tree', 'neo-tree-popup', 'notify' } },
              buftype = { 'terminal', 'quickfix' },
            },
          }
        end,
      },
    },
  }

  use { 'numToStr/Comment.nvim' }

  -- =======================
  -- 🌳 Treesitter (lepší syntax highlighting)
  -- =======================
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'
  use 'windwp/nvim-ts-autotag' -- Automatické zavírání HTML/XML tagů

  -- =======================
  -- 🔄 Historie a navigace
  -- =======================
  use 'ThePrimeagen/harpoon' -- Rychlé přepínání mezi soubory
  use 'mbbill/undotree'      -- Stromová historie undo/redo
  use 'tpope/vim-fugitive'   -- Git integrace

  -- =======================
  -- 🔧 LSP (Language Server Protocol)
  -- =======================
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- 🔥 LSP-Zero: Zjednodušené nastavení LSP + Autocompletion
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'neovim/nvim-lspconfig' },
      -- 🔥 Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
    }
  }

  -- =======================
  -- 📊 Status Line (Lualine)
  -- =======================
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- =======================
  -- 🛠️ Formátování a linting
  -- =======================
  use 'jose-elias-alvarez/null-ls.nvim' -- Pro custom LSP-based formátování
  use 'MunifTanjim/prettier.nvim'       -- Podpora Prettier pro formátování

  -- =======================
  -- 🤖 AI Assist
  -- =======================
  use 'github/copilot.vim'
  -- Required dependencies for avante.nvim
  --  use 'stevearc/dressing.nvim'
  -- use 'nvim-lua/plenary.nvim'
  --use 'MunifTanjim/nui.nvim'
  --use 'MeanderingProgrammer/render-markdown.nvim'
  -- Optional dependencies for avante.nvim
  --use 'HakonHarnes/img-clip.nvim'
  --use 'zbirenbaum/copilot.lua'
  -- Avante.nvim with build process
  -- use {
  -- 'yetone/avante.nvim',
  -- branch = 'main',
  -- run = 'make',
  --config = function()
  -- Configuration will be in after/plugin/avante.lua
  -- end
  --}
  --
  -- Snacks.nvim (utility library)
  use "folke/snacks.nvim"
  
  -- Claude Code Integration
  use {
    "coder/claudecode.nvim",
    requires = { "folke/snacks.nvim" }
  }
  use {
    'windwp/nvim-autopairs', -- Auto close brackets, quotes, etc.
    config = function() require('nvim-autopairs').setup() end
  }

  use {
    'folke/which-key.nvim', -- Help you remember keybindings
    config = function() require('which-key').setup() end
  }

  use {
    'folke/trouble.nvim', -- Better diagnostics window
    requires = 'nvim-tree/nvim-web-devicons'
  }

  use {
    'lewis6991/gitsigns.nvim', -- Git integration in the sign column
    config = function()
      require('gitsigns').setup()
    end
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end
  }

  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('alpha').setup(require('alpha.themes.dashboard').config)
    end
  }
end)
