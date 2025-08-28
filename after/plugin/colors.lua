function ColorMyPencil(color)
  color = color or "tokyonight" -- solarized-osaka, rose-pine, tokyonight, mellow, vscode
  vim.cmd.colorscheme(color)

  vim.cmd [[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalNC guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
  highlight NeoTreeNormal guibg=NONE ctermbg=NONE
  highlight NeoTreeNormalNC guibg=NONE ctermbg=NONE
]]

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

  -- Add diagnostic highlights
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#db4b4b" })
  vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#e0af68" })
  vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#0db9d7" })
  vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#10B981" })

  -- Nastavení částečně transparentního pozadí pro sign sloupec (40% opacity)
  vim.cmd([[
    highlight clear SignColumn
    highlight SignColumn guibg=#1e1e2e40 ctermbg=NONE
    highlight GutterSignsChanged guibg=#1e1e2e40
    highlight GutterSignsDelete guibg=#1e1e2e40
    highlight GutterSignsAdd guibg=#1e1e2e40
  ]])

  -- Pro diagnostické znaky
  vim.cmd([[
    highlight DiagnosticSignError guibg=#1e1e2e40
    highlight DiagnosticSignWarn guibg=#1e1e2e40
    highlight DiagnosticSignInfo guibg=#1e1e2e40
    highlight DiagnosticSignHint guibg=#1e1e2e40
  ]])

  -- Pro Git znaky
  vim.cmd([[
    highlight GitSignsAdd guibg=#1e1e2e40
    highlight GitSignsChange guibg=#1e1e2e40
    highlight GitSignsDelete guibg=#1e1e2e40
  ]])
end

ColorMyPencil()
