-- Compatibility shim for older/newer Neovim/null-ls API
-- Ensures vim.lsp._request_name_to_capability is at least an empty table
-- so null-ls won't error when indexing it.
if vim and vim.lsp and vim.lsp._request_name_to_capability == nil then
  vim.lsp._request_name_to_capability = {}
end
local lsp_zero = require('lsp-zero')

-- single on_attach used both by lsp-zero and server configs
local function on_attach(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  -- diagnostic navigation wrappers for compatibility across versions
  local function diag_goto_next()
    local d = vim.diagnostic
    if d and d.goto_next then return d.goto_next({}) end
    if d and d.jump then return d.jump({ count = 1 }) end
    if vim.lsp and vim.lsp.diagnostic and vim.lsp.diagnostic.goto_next then
      return vim.lsp.diagnostic.goto_next()
    end
  end
  local function diag_goto_prev()
    local d = vim.diagnostic
    if d and d.goto_prev then return d.goto_prev({}) end
    if d and d.jump then return d.jump({ count = -1 }) end
    if vim.lsp and vim.lsp.diagnostic and vim.lsp.diagnostic.goto_prev then
      return vim.lsp.diagnostic.goto_prev()
    end
  end

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  -- use new diagnostics API (vim.diagnostic)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "<C-]>", diag_goto_next, opts)
  vim.keymap.set("n", "<C-[>", diag_goto_prev, opts)
  -- Also provide standard ]d/[d diagnostic jumps
  vim.keymap.set("n", "]d", diag_goto_next, opts)
  vim.keymap.set("n", "[d", diag_goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

-- keep lsp-zero aware of our on_attach as well (features like format helpers)
lsp_zero.on_attach(on_attach)

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
    'gopls'        -- Go language server
  },
  -- disable automatic enabling of installed servers to avoid calling vim.lsp.enable()
  automatic_enable = false,
})

-- capabilities (cmp integration)
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- helper to support both new vim.lsp.config and legacy lspconfig
local function set_server(name, opts)
  if vim.lsp and vim.lsp.config then
    vim.lsp.config[name] = opts
  else
    require('lspconfig')[name].setup(opts)
  end
end

-- LSP server configurations (new API preferred)
set_server('ts_ls', {
  on_attach = on_attach,
  capabilities = lsp_capabilities,
})

-- Lua: start from lsp-zero's recommended options and extend
do
  local lua_opts = lsp_zero.nvim_lua_ls()
  lua_opts.on_attach = on_attach
  lua_opts.capabilities = lsp_capabilities
  -- keep explicit diagnostics for 'vim' global
  lua_opts.settings = lua_opts.settings or {}
  lua_opts.settings.Lua = lua_opts.settings.Lua or {}
  lua_opts.settings.Lua.diagnostics = lua_opts.settings.Lua.diagnostics or {}
  lua_opts.settings.Lua.diagnostics.globals = lua_opts.settings.Lua.diagnostics.globals or { 'vim' }
  set_server('lua_ls', lua_opts)
end

for _, name in ipairs({ 'cssls', 'html', 'jsonls', 'eslint', 'tailwindcss' }) do
  set_server(name, {
    on_attach = on_attach,
    capabilities = lsp_capabilities,
  })
end

-- Go (gopls)
set_server('gopls', {
  on_attach = on_attach,
  capabilities = lsp_capabilities,
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

-- enable the new LSP auto-manager if available (Neovim 0.11+)
if vim.lsp and type(vim.lsp.enable) == 'function' then
  vim.lsp.enable({ 'ts_ls', 'lua_ls', 'cssls', 'html', 'jsonls', 'eslint', 'tailwindcss', 'gopls' })
end

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
