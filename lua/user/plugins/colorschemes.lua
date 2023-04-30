return {
    {
        -- tokyonight-night, tokyonight-storm, tokyonight-day, tokyonight-moon
        "folke/tokyonight.nvim",
        lazy = false,
        opts = { style = "moon" },
    },
    {
        -- github_dark, github_dimmed, github_dark_default, github_light,
        "projekt0n/github-nvim-theme",
        lazy = true,
        tag = "v0.0.7",
        config = function()
            require("github-theme").setup()
            vim.cmd("colorscheme github_dark")
        end,
    },
    -- catppuccin
    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
    },
}
