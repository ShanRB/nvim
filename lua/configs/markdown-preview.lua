local status_ok, markdown = pcall(require, "lualine")
if not status_ok then
	return
end

markdown.setup()
