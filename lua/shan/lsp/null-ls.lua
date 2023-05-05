local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

-- code action sources
local code_actions = null_ls.builtins.code_actions

-- diagnostic sources
local diagnostics = null_ls.builtins.diagnostics

-- formatting sources
local formatting = null_ls.builtins.formatting

-- hover sources
local hover = null_ls.builtins.hover

-- completion sources
local completion = null_ls.builtins.completion

null_ls.setup({
    debug = false,
    sources = {
        formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
        formatting.stylua,
        -- python
        diagnostics.flake8.with({
            diagnostic_config = {
                underline = true, virtual_text = false, signs = true, update_in_insert = false, severity_sort = true,
            },
            diagnostics_format = "[#{c}] #{m} (#{s})",
            method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
        }),
        formatting.black,
        formatting.isort.with({ extra_args = { "--profile", "black", "--line-length", "119" } }),
        -- git
        null_ls.builtins.code_actions.gitsigns,
        completion.spell,
        -- diagnostics.flake8
    },
})

local mason_null_ls_status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status_ok then
    return
end
mason_null_ls.setup({
    ensure_installed = nil,
    automatic_installation = true,
    automatic_setup = false,
})
