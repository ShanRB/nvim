return {
    -- Tree sitter
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        config = function()
            require("user.configs.treesitter")
        end,
    },
    "p00f/nvim-ts-rainbow",
    {
        "windwp/nvim-autopairs",
        config = function()
            require("user.configs.autopairs")
        end,
    },
    "JoosepAlviste/nvim-ts-context-commentstring",
}
