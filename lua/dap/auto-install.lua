local status_ok, mason_dap = pcall(require, "mason-nvim-dap")
if not status_ok then
    vim.notify("mason-nvim-dap not found")
    return
end

mason_dap.setup({
    ensure_installed = { "python" },
    automatic_installation = true,
    handlers = nil,
})
