---@class ThemeOptions
---@field TOKYONIGHT string
---@field ONEDARK string
---@field ROSE_PINE string
---@field MELLOW string
---@field SOLARIZED_OSAKA string



local colors = {
  TOKYONIGHT = "tokyonight",
  ONEDARK = "onedark",
  ROSE_PINE = "rose-pine",
  MELLOW = "mellow",
  SOLARIZED_OSAKA = "solarized-osaka",
}

-- Definice barevných palet pro jednotlivá témata

---@param color string|nil
function ColorMyPencil(color)
  color = color or colors.TOKYONIGHT -- Výchozí téma

  -- Konfigurace OneDark před načtením
  if color == "onedark" then
    local ok, onedark = pcall(require, 'onedark')
    if ok then
      onedark.setup {
        style = 'darker',
      }
    end
  end

  -- Konfigurace Tokyo Night před načtením
  if color == "tokyonight" then
    local ok, tokyonight = pcall(require, 'tokyonight')
    if ok then
      tokyonight.setup {
        transparent = true,
        on_highlights = function(hl, c)
          -- Normal (aktivní okno) - transparentní
          hl.Normal = { bg = "NONE" }
          -- NormalNC (neaktivní okna) - jemně zatemněné pozadí pro vizuální odlišení
          hl.NormalNC = { bg = "#1a1b26" }
        end,
      }
    end
  end

  vim.cmd.colorscheme(color)

  -- Nastavení custom highlights PO načtení color scheme
  -- Yank highlight s výraznou žlutou barvou
  vim.cmd([[
    hi YankHighlight guibg=#ffeb3b guifg=#000000
  ]])

  -- Transparentní pozadí pro Neovim obecně
  if color == "tokyonight" then
    vim.cmd([[
      hi Normal guibg=NONE ctermbg=NONE
      hi NormalNC guibg=#1a1b26 ctermbg=NONE
      hi NormalFloat guibg=NONE ctermbg=NONE
      hi SignColumn guibg=NONE ctermbg=NONE
      hi LineNr guibg=NONE ctermbg=NONE
      hi Folded guibg=NONE ctermbg=NONE
      hi NonText guibg=NONE ctermbg=NONE
      hi SpecialKey guibg=NONE ctermbg=NONE
      hi VertSplit guibg=NONE ctermbg=NONE
      hi EndOfBuffer guibg=NONE ctermbg=NONE
    ]])
  else
    vim.cmd([[
      hi Normal guibg=NONE ctermbg=NONE
      hi NormalFloat guibg=NONE ctermbg=NONE
      hi SignColumn guibg=NONE ctermbg=NONE
      hi LineNr guibg=NONE ctermbg=NONE
      hi Folded guibg=NONE ctermbg=NONE
      hi NonText guibg=NONE ctermbg=NONE
      hi SpecialKey guibg=NONE ctermbg=NONE
      hi VertSplit guibg=NONE ctermbg=NONE
      hi EndOfBuffer guibg=NONE ctermbg=NONE
    ]])
  end

  -- Transparentní pozadí pro Neo-tree
  -- NeoTreeNormal = aktivní Neo-tree (transparentní)
  -- NeoTreeNormalNC = neaktivní Neo-tree (zatemněné pozadí)
  if color == "tokyonight" then
    vim.cmd([[
      hi NeoTreeNormal guibg=NONE ctermbg=NONE
      hi NeoTreeNormalNC guibg=#1a1b26 ctermbg=NONE
      hi NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
      hi NeoTreeVertSplit guibg=NONE ctermbg=NONE
      hi NeoTreeCursorLine guibg=#2a3a4a gui=NONE
    ]])
  else
    vim.cmd([[
      hi NeoTreeNormal guibg=NONE ctermbg=NONE
      hi NeoTreeNormalNC guibg=NONE ctermbg=NONE
      hi NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
      hi NeoTreeVertSplit guibg=NONE ctermbg=NONE
      hi NeoTreeCursorLine guibg=#2a3a4a gui=NONE
    ]])
  end

  -- Terminálová okna (např. Claude Code terminal)
  if color == "tokyonight" then
    vim.cmd([[
      hi! link Terminal Normal
      hi! link TerminalNC NormalNC
    ]])
  end

  -- Téma se nyní používá s výchozími barvami
  -- Pouze exportujeme barvy pro případné použití pluginy
end

-- Funkce pro snadné přepínání témat
function SwitchColorTheme(theme)
  local available_themes = { "tokyonight", "onedark", "rose-pine", "mellow" }

  if vim.tbl_contains(available_themes, theme) then
    ColorMyPencil(theme)
    print("Switched to " .. theme .. " theme")
  else
    print("Available themes: " .. table.concat(available_themes, ", "))
  end
end

-- Vytvoření příkazů pro snadné přepínání
vim.api.nvim_create_user_command("ColorScheme", function(opts)
  SwitchColorTheme(opts.args)
end, {
  nargs = 1,
  complete = function()
    return { "tokyonight", "onedark", "rose-pine", "mellow" }
  end
})

-- Inicializace s výchozím tématem
ColorMyPencil()
