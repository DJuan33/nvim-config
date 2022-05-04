require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
require("user.comment")
require("user.gitsigns")
require("user.nvim-tree")
require("user.bufferline")
require("user.toggleterm")
require("user.project")
require("user.lualine")
require("user.impatient")
require("user.indentline")
require("user.alpha")
require("user.whichkey")
require("user.trouble")
require("user.auto-session")
require("user.zen-mode")
require("user.todo")
require("user.neorg")
require("user.colorscheme")

-- Redraw statusline every second to make lualine's clock work
if _G.Statusline_timer == nil then
	_G.Statusline_timer = vim.loop.new_timer()
else
	_G.Statusline_timer:stop()
end
_G.Statusline_timer:start(
	0, -- never timeout
	1000, -- repeat every 1000 ms
	vim.schedule_wrap(function() -- updater function
		vim.api.nvim_command("redrawstatus")
	end)
)
