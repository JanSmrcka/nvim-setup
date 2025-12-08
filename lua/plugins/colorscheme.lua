-- Colorscheme configuration

return {
  -- Install onedark
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "darker",
      transparent = true,
      lualine = {
        transparent = true,
      },
      diagnostics = {
        darker = true,
        undercurl = true,
        background = false,
      },
    },
    config = function(_, opts)
      require("onedark").setup(opts)
      require("onedark").load()

      -- Yank highlight
      vim.cmd([[hi YankHighlight guibg=#ffeb3b guifg=#000000]])
    end,
  },
  -- Set as default colorscheme for LazyVim
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
      style = "darker",
    },
  },
}
