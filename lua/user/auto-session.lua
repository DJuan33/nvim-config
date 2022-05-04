local auto_session_status_ok, auto_session_config = pcall(require, "auto-session")
if not auto_session_status_ok then
	return
end

local sessions_lens_status_ok, session_lens_config = pcall(require, "auto-session")
if not sessions_lens_status_ok then
	return
end

auto_session_config.setup({
	log_level = "info",
	auto_session_enable_last_session = false,
	auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
	auto_session_enabled = false,
	auto_save_enabled = false,
	auto_restore_enabled = false,
	auto_session_suppress_dirs = false,
	bypass_session_save_file_types = false,
})

session_lens_config.setup({
	previewer = true,
})
