-- Formatting with conform.nvim (extends LazyVim default)

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "eslint_d", "prettier" },
      javascriptreact = { "eslint_d", "prettier" },
      typescript = { "eslint_d", "prettier" },
      typescriptreact = { "eslint_d", "prettier" },
      vue = { "eslint_d", "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      less = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      graphql = { "prettier" },
    },
    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = true,
    },
  },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
      end,
      mode = { "n", "v" },
      desc = "Format file or range",
    },
  },
}
