-- Harpoon 2 - Quick file navigation
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    -- Add file to harpoon
    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():add()
    end, { desc = "Harpoon add file" })

    -- Toggle quick menu
    vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Harpoon menu" })

    -- Navigate to specific files (1-5)
    vim.keymap.set("n", "<leader>1", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon file 1" })
    vim.keymap.set("n", "<leader>2", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon file 2" })
    vim.keymap.set("n", "<leader>3", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon file 3" })
    vim.keymap.set("n", "<leader>4", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon file 4" })
    vim.keymap.set("n", "<leader>5", function()
      harpoon:list():select(5)
    end, { desc = "Harpoon file 5" })

    -- Navigate prev/next in list
    vim.keymap.set("n", "<C-S-P>", function()
      harpoon:list():prev()
    end, { desc = "Harpoon prev" })
    vim.keymap.set("n", "<C-S-N>", function()
      harpoon:list():next()
    end, { desc = "Harpoon next" })
  end,
}
