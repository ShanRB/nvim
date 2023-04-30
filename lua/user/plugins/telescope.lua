return {
    -- Fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-media-files.nvim",
            "nvim-telescope/telescope-fzy-native.nvim",
        },
        config = function()
            require("user.configs.telescope")
        end,
    },
}
