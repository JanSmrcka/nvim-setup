function ColorMyPencil(color)
  color = color or "solarized-osaka"
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
end

ColorMyPencil()
