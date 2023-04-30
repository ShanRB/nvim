return {
    "folke/lazy.nvim",
    {
        "lewis6991/impatient.nvim",
        config = function()
            require("user.configs.impatient")
        end,
    },
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
}
