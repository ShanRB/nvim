return {
    -- File Explorer
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("user.configs.nvim-tree")
        end,
    },
}
