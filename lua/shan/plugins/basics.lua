return {
    "folke/lazy.nvim",
    {
        "lewis6991/impatient.nvim",
        config = function()
            require("shan.configs.impatient")
        end,
    },
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
}
