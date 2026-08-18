return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                cssls = {
                    settings = {
                        css = { lint = { unknownAtRules = "ignore" } },
                        scss = { lint = { unknownAtRules = "ignore" } },
                        less = { lint = { unknownAtRules = "ignore" } },
                    },
                },
                gopls = {
                    settings = {
                        gopls = {
                            semanticTokens = true,
                            analyses = {
                                unusedparams = true,
                            },
                            staticcheck = true,
                        },
                    },
                },
            },
        },
    },
}
