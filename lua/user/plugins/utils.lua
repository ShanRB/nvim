return {
    {
        "numToStr/Comment.nvim",
        config = function()
            require("user.configs.comment")
        end,
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            require("user.configs.notify")
        end,
    },
    {
        "folke/which-key.nvim",
        config = function()
            require("user.configs.which-key")
        end,
    },
}
