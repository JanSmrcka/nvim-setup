-- Centralizovaná barevná paleta pro jednotnost napříč pluginy
local colors = {}

-- Definice barevných palet pro jednotlivá témata

function ColorMyPencil(color)
  color = color or "onedark" -- Výchozí téma

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
