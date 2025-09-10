
-- Compatibility shim for older/newer Neovim/null-ls API
-- Ensures vim.lsp._request_name_to_capability is at least an empty table
-- so null-ls won't error when indexing it.
if vim and vim.lsp and vim.lsp._request_name_to_capability == nil then
  vim.lsp._request_name_to_capability = {}
end
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "<C-]>", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "<C-[>", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'ts_ls',
    'lua_ls',
    'cssls',
    'html',
    'jsonls',
    'eslint',
    'tailwindcss', -- Tailwind CSS Language Server
    'gopls' -- Go language server
  },
  -- disable automatic enabling of installed servers to avoid calling vim.lsp.enable()
  automatic_enable = false,
})

-- Use setup_handlers for per-server handlers (recommended API)
-- Register handlers in a version-compatible way
do
  local mlsp = require('mason-lspconfig')
  local handlers = {
    -- default handler: use lsp-zero's default setup
    lsp_zero.default_setup,
    -- custom handler for lua_ls
    ['lua_ls'] = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }

  if type(mlsp.setup_handlers) == 'function' then
    mlsp.setup_handlers(handlers)
  else
    -- older versions expect handlers passed to setup; re-call setup with handlers
    mlsp.setup({
      ensure_installed = {
        'ts_ls',
        'lua_ls',
        'cssls',
        'html',
        'jsonls',
        'eslint',
        'tailwindcss',
        'gopls'
      },
      automatic_enable = false,
      handlers = handlers,
    })
  end
end

-- Nastavení pro jednotlivé LSP servery
require('lspconfig').ts_ls.setup({})
require('lspconfig').lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' } -- Uznává 'vim' jako globální proměnnou
      }
    }
  }
})

require('lspconfig').cssls.setup({})
require('lspconfig').html.setup({})
require('lspconfig').jsonls.setup({})
require('lspconfig').eslint.setup({})
require('lspconfig').tailwindcss.setup({})

-- Konfigurace pro Go
require('lspconfig').gopls.setup({
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      usePlaceholders = true,
      completeUnimported = true,
    },
  },
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

-- this is the function that loads the extra snippets to luasnip
-- from rafamadriz/friendly-snippets
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip', keyword_length = 2 },
    { name = 'buffer',  keyword_length = 3 },
  },
  formatting = lsp_zero.cmp_format({ details = false }),
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping.complete(),
  }),
})
