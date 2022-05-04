-- local status_ok, neorg = pcall(require, "neorg")
-- if not status_ok then
-- 	return
-- end

local neorg = require("neorg")

neorg.setup({
	load = {
		["core.defaults"] = {},
		["core.norg.qol.toc"] = {
			config = {},
		},
	},
})
