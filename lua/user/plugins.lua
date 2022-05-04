local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use({ "wbthomason/packer.nvim" })
	use({ "nvim-lua/popup.nvim" }) -- An implementation of the Popup API from vim in Neovim
	use({ "nvim-lua/plenary.nvim" })
	use({ "davidgranstrom/nvim-markdown-preview", cmd = { "MarkdownPreview" } })

	-- cmp & plugins
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-nvim-lua" })

	-- snippets
	use({ "L3MON4D3/LuaSnip" })
	use({ "rafamadriz/friendly-snippets" })

	-- LSP & formatters
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/nvim-lsp-installer" })
	use({ "jose-elias-alvarez/null-ls.nvim" })
	use({ "folke/trouble.nvim", cmd = { "TroubleToggle" } })
	use({ "tami5/lspsaga.nvim" })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })

	-- Treesitter & syntax
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "windwp/nvim-autopairs" })
	use({ "numToStr/Comment.nvim" })

	--  -- Git
	use({ "lewis6991/gitsigns.nvim" })

	--  -- Colorschemes
	use({ "lunarvim/colorschemes" })
	use({ "lunarvim/darkplus.nvim" })
	use({ "Mofiqul/dracula.nvim" })
	use({ "norcalli/nvim-colorizer.lua" })

	--  File explorer
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua" })

	-- Status lines
	use({ "akinsho/bufferline.nvim" })
	use({ "nvim-lualine/lualine.nvim" })

	-- Terminal
	use({ "akinsho/toggleterm.nvim", cmd = { "ToggleTerm" } })

	-- Project handling
	use({ "ahmedkhalf/project.nvim" })

	--  Performance
	use({ "lewis6991/impatient.nvim" })

	-- Start
	use({ "goolord/alpha-nvim" })

	--  Keybindings
	use({ "folke/which-key.nvim" })

	-- Buffer handling.
	use({ "famiu/bufdelete.nvim" })

	-- Session handling
	use({ "rmagatti/auto-session" })
	use({ "rmagatti/session-lens" })

	-- Debugger
	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui" })

	-- Zenmode
	use({ "folke/zen-mode.nvim" })
	use({ "folke/twilight.nvim" })

	-- Comments
	use({ "folke/todo-comments.nvim" })

	-- Neorg
	use({ "nvim-neorg/neorg" })

	-- LANGUAGES --
	-- Flutter
	use({
		"akinsho/flutter-tools.nvim",
		ft = { "dart" },
		config = function()
			require("user.lsp.settings.dart-lsp")
		end,
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
