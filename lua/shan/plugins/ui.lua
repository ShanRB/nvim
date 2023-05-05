return {
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("shan.configs.lualine")
        end,
    },
    {
        "akinsho/bufferline.nvim",
        tag = "v3.*",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("shan.configs.bufferline")
        end,
    },
}
