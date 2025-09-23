-- Minimal Snacks setup to satisfy healthcheck and avoid enabling heavy modules by default
local ok, snacks = pcall(require, 'snacks')
if ok then
  snacks.setup({
    bigfile = { enabled = false },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    image = { enabled = false },
    input = { enabled = false },
    lazygit = { enabled = false },
    notifier = { enabled = false },
    picker = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    terminal = { enabled = false },
    toggle = { enabled = true },
    words = { enabled = false },
  })
end
