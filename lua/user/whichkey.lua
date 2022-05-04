local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local normal_opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local visual_opts = {
	mode = "v", -- VISUAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local normal_mappings = {
	a = { "<cmd>Alpha<cr>", "Alpha" },
	b = {
		name = "Buffer",
		s = {
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"Search buffer",
		},
		c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	},
	e = { "<cmd>NvimTreeToggle<cr>", " File Explorer" },
	d = {
		name = "Debugger",
		b = { "<CMD>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
		c = { "<CMD>lua require'dap'.continue()<CR>", "Continue" },
		i = { "<CMD>lua require'dap'.step_into()<CR>", "Step Into" },
		o = { "<CMD>lua require'dap'.step_over()<CR>", "Step Over" },
		u = { "<CMD>lua require'dapui'.toggle()<CR>", "Toggle UI" },
	},

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	g = {
		name = "Git",
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
	},
	l = {
		name = "LSP",
		a = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format Document" },
		n = { "<cmd>Telescope lsp_definitions<cr>", "Go to Definition" },
		R = { "<cmd>Telescope lsp_references<cr>", "Find References" },
		h = { "<cmd>Lspsaga hover_doc<cr>", "Hover Documentation" },
		s = { "<cmd>Lspsaga signature_help<cr>", "Signature Help" },
		r = { "<cmd>Lspsaga rename<cr>", "Rename symbol" },
		c = { "<cmd>Lspsaga require'lspsaga.diagnostic'.show_cursor_diagnostics()<cr>", "Show cursor Diagnostics" },
		j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Diagnostic Next" },
		k = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Diagnostic Prev" },
		i = { "<cmd>LspInfo<cr>", "LSP Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		d = { "<cmd>TroubleToggle<CR> document_diagnostics", "Document Diagnostics" },
		w = { "<cmd>TroubleToggle<CR> workspace_diagnostics", "Workspace Diagnostics" },
		t = { "<cmd>TodoTrouble<CR>", "TODO Trouble" },
		D = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},
	S = { "<CMD>Telescope<CR>", "Telescope" },
	Z = { "<CMD>ZenMode<CR>", "Zen Mode" },
	s = {
		name = "Search",
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		f = {
			"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"Find files",
		},
		F = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
		p = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
		s = { "<cmd>:SearchSession<cr>", "Projects" },
		t = { "<cmd>TodoTelescope<cr>", "TODOs" },
		b = {
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"Search buffer",
		},
	},
	t = {
		name = "Terminal",
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		t = { "<cmd>ToggleTerm direction=tab<cr>", "Tab" },
		s = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},
	v = {
		name = "VIM",
		a = { "<CMD>wa<CR>", "Save all" },
		w = { "<cmd>w!<CR>", "Save" },
		x = { "<cmd>x<CR>", "Save and Quit" },
		Q = { "<cmd>q!<CR>", "Quit Without Save" },
		h = { "<cmd>nohlsearch<CR>", "No Highlight" },
		t = { "<cmd>tabclose<CR>", "Close Tab" },
		-- s = { "<g><C-g>", "Selection Info" },
	},
}

local visual_mappings = {
	v = {
		name = "VIM",
		s = { "<g><C-g>", "Selection Info" },
	},
}

which_key.setup(setup)
which_key.register(normal_mappings, normal_opts)
which_key.register(visual_mappings, visual_opts)
