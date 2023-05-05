return {
    {
        "numToStr/Comment.nvim",
        config = function()
            require("shan.configs.comment")
        end,
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            require("shan.configs.notify")
        end,
    },
    {
        "folke/which-key.nvim",
        config = function()
            require("shan.configs.which-key")
        end,
    },
}
