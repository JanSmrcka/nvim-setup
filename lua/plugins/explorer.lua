return {
    "folke/snacks.nvim",
    opts = {
        picker = {
            sources = {
                explorer = {
                    hidden = true, -- show dotfiles like .gitignore, .env
                    ignored = true, -- show files ignored by git (.env, node_modules, etc.)
                },
            },
        },
    },
}
