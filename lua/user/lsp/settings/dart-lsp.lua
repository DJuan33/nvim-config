local flutter_status_ok, flutter = pcall(require, "flutter-tools")
if not flutter_status_ok then
	return
end

require("telescope").load_extension("flutter")

flutter.setup({
	debugger = { -- integrate with nvim dap + install dart code debugger
		enabled = false,
		run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
	},
})
