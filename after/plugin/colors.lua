-- Centralizovaná barevná paleta pro jednotnost napříč pluginy
local colors = {}

-- Definice barevných palet pro jednotlivá témata
local theme_palettes = {
  tokyonight = {
    primary = "#7aa2f7",
    secondary = "#bb9af7",
    accent = "#73daca",
    success = "#9ece6a",
    warning = "#e0af68",
    error = "#f7768e",
    info = "#7dcfff",
    hint = "#1abc9c",
    bg_sidebar = "#1f2335",
    fg_sidebar = "#a9b1d6",
    border = "#29394f"
  },
  onedark = {
    primary = "#61afef",
    secondary = "#c678dd",
    accent = "#56b6c2",
    success = "#98c379",
    warning = "#e5c07b",
    error = "#e06c75",
    info = "#61afef",
    hint = "#56b6c2",
    bg_sidebar = "#21252b",
    fg_sidebar = "#abb2bf",
    border = "#3e4451"
  },
  ["rose-pine"] = {
    primary = "#c4a7e7",
    secondary = "#f6c177",
    accent = "#9ccfd8",
    success = "#31748f",
    warning = "#f6c177",
    error = "#eb6f92",
    info = "#9ccfd8",
    hint = "#31748f",
    bg_sidebar = "#1f1d2e",
    fg_sidebar = "#e0def4",
    border = "#403d52"
  },
  mellow = {
    primary = "#7fbbb3",
    secondary = "#d699b6",
    accent = "#83c092",
    success = "#a7c080",
    warning = "#dbbc7f",
    error = "#e67e80",
    info = "#7fbbb3",
    hint = "#83c092",
    bg_sidebar = "#2d353b",
    fg_sidebar = "#d3c6aa",
    border = "#514045"
  }
}

function ColorMyPencil(color)
  color = color or "tokyonight" -- Výchozí téma

  -- Konfigurace OneDark před načtením
  if color == "onedark" then
    local ok, onedark = pcall(require, 'onedark')
    if ok then
      onedark.setup {
        style = 'darker',
      }
    end
  end

  vim.cmd.colorscheme(color)

  -- Nastavení aktuální palety barev
  colors = theme_palettes[color] or theme_palettes.onedark

  -- Téma se nyní používá s výchozími barvami
  -- Pouze exportujeme barvy pro případné použití pluginy
end

-- Funkce pro získání aktuálních barev (exportovaná pro ostatní pluginy)
function GetCurrentColors()
  return colors
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
