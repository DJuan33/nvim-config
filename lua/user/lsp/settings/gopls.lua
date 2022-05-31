local status_ok, gopls = pcall(require, "lspconfig")
if not status_ok then
	return
end

return gopls
