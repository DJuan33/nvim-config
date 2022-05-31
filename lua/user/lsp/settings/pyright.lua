local status_ok, pyright = pcall(require, "lspconfig")
if not status_ok then
	return
end

return pyright

