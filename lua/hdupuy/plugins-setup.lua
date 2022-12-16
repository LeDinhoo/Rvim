vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

----🄻 🄸 🅂 🅃  🄾 🄵  🄿 🄻 🅄 🄶 🄸 🄽 🅂----

return packer.startup(function(use)
	-- Packer --
	use("wbthomason/packer.nvim")

	-- Plenary and file tree
	use("nvim-lua/plenary.nvim")
	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")
	use("numToStr/Comment.nvim")
	use("nvim-lualine/lualine.nvim")
	use("folke/tokyonight.nvim")
	use("lukas-reineke/indent-blankline.nvim")

	-- Telescope and fuzzy search
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

	-- Completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- Snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- Language Server Protocol
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("onsails/lspkind.nvim")

	-- Treesitter and language support
	use({
	  "nvim-treesitter/nvim-treesitter",
	  run = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	  end,
	})
	use("nvim-treesitter/nvim-treesitter-context")

	-- Other
	use("windwp/nvim-autopairs")
	use("lewis6991/gitsigns.nvim")
	use("glepnir/dashboard-nvim")
	use("romgrk/barbar.nvim")
	use({ "nyoom-engineering/oxocarbon.nvim" })

	use {
		'rcarriga/nvim-notify',
		config = function ()
		  require("notify").setup {
			stages = 'fade_in_slide_out',
			background_colour = 'FloatShadow',
			timeout = 3000,
		  }
		  vim.notify = require('notify')
		end
	  }

	use 'karb94/neoscroll.nvim'
	
	-- Sync
	if packer_bootstrap then
	  require("packer").sync()
	end
  end)

