-- Telescope configuration with custom keymaps

local transform_mod = require("telescope.actions.mt").transform_mod

local actions = transform_mod({
  send_to_qflist = function(prompt_bufnr)
    require("telescope.actions").send_to_qflist(prompt_bufnr)
    require("telescope.actions").open_qflist(prompt_bufnr)
  end,
})
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      {
        "<C-p>",
        function()
          local ok = pcall(require("telescope.builtin").git_files, { show_untracked = true })
          if not ok then
            require("telescope.builtin").find_files()
          end
        end,
        desc = "Git Files (fallback to find)",
      },
      { "<C-g>", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>ph", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
      {
        "<leader>ps",
        function()
          require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
        end,
        desc = "Grep String",
      },
      { "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer Fuzzy Find" },
      { "<leader>?", "<cmd>Telescope oldfiles<cr>", desc = "Old Files" },
      { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      { "<C-b>", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "File Browser" },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").move_selection_next, -- Move to the next item
            ["<C-k>"] = require("telescope.actions").move_selection_previous, -- Move to the previous item
            ["<C-l>"] = require("telescope.actions").select_default,
            ["<C-q>"] = actions.send_to_qflist,
          },
          n = {
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-l>"] = require("telescope.actions").select_default,
            ["<C-q>"] = actions.send_to_qflist,
          },
        },
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("file_browser")
    end,
  },
}
