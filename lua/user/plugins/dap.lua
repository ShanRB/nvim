return {
    -- Debugger
    {
        "mfussenegger/nvim-dap",
        lazy = true,
    },
    "jay-babu/mason-nvim-dap.nvim",
    { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
}
