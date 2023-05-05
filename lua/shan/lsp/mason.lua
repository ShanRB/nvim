local servers = {
    -- find more on https://github.com/williamboman/mason-lspconfig.nvim
    "lua_ls",
    "pyright",
    "jsonls",
    "dockerls",
    "docker_compose_language_service",
    "marksman",
    "sqlls",
    "clangd",
}

require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("shan.lsp.handlers").on_attach,
        capabilities = require("shan.lsp.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    local require_ok, conf_opts = pcall(require, "shan.lsp.settings." .. server)
    if require_ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    lspconfig[server].setup(opts)
end
