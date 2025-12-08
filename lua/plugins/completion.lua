-- Completion keymaps (blink.cmp)

return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      trigger = {
        show_on_keyword = false,
        show_on_trigger_character = false,
        show_on_insert_on_trigger_character = false,
      },
    },
    keymap = {
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<C-e>"] = { "show", "hide", "fallback" },
    },
    sources = {
      default = { "lsp", "path" },
      per_filetype = {
        graphql = {},
      },
      -- Disable buffer and snippets sources
      providers = {
        buffer = { enabled = false },
        snippets = { enabled = false },
      },
    },
  },
}
