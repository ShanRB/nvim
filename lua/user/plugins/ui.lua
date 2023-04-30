return {
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("user.configs.lualine")
        end,
    },
    {
        "akinsho/bufferline.nvim",
        tag = "v3.*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("user.configs.bufferline")
        end,
    },
}
