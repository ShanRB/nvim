for _, source in ipairs({
    "shan.settings",
    "shan.options",
    "shan.keymaps",
    "shan.plugin-manager",
    "shan.colorscheme",
    "shan.autocmds",
}) do
    local status_ok, err = pcall(require, source)
    if not status_ok then
        vim.api.nvim_err_writeln("Unable to load " .. source .. "\n\n" .. err)
    end
end

if settings.default_colorscheme then
    if not pcall(vim.cmd.colorscheme, settings.default_colorscheme) then
        vim.notify("Error setting up colorscheme: " .. settings.default_colorscheme, vim.log.levels.ERROR)
    end
end
