return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        config = function()
          require("shan.configs.mason")
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            {
                "hrsh7th/cmp-nvim-lsp",
                cond = function()
                    return require("lazy.core.config").plugins["nvim-cmp"] ~= nil
                end,
            },
        },
        config = function()
            require("shan.lsp")
        end,
    },
    "jay-babu/mason-null-ls.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "RRethy/vim-illuminate",
}
