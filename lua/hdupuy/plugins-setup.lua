
----------------------------------
--█▀▀█ █── █──█ █▀▀▀ ─▀─ █▀▀▄ █▀▀  
--█▄▄█ █── █──█ █─▀█ ▀█▀ █──█ ▀▀█  
--█─── ▀▀▀ ─▀▀▀ ▀▀▀▀ ▀▀▀ ▀──▀ ▀▀▀  
-----------------------------------

-----🄿 🄰 🄲 🄺 🄴 🅁  🄲 🄾 🄽 🄵 🄸 🄶 -----

-- Auto install Packer if not installed --
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer()


-- Auto installs/updates/removes plugins when save --
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])


-- Import Packer safely --
local status, packer = pcall(require, "packer")
if not status then
  return
end

----🄻 🄸 🅂 🅃  🄾 🄵  🄿 🄻 🅄 🄶 🄸 🄽 🅂            ----

return packer.startup(function(use)

    -- Packer & Plenary --
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

    -- File explorer & icons --
    use ("nvim-tree/nvim-tree.lua")
    use("nvim-tree/nvim-web-devicons")

    -- Commenting --
    use "numToStr/Comment.nvim"

    -- Bottom bar --
    use("nvim-lualine/lualine.nvim")

    -- Colorscheme --
    use 'folke/tokyonight.nvim'

    -- Indent with colors --
    use "lukas-reineke/indent-blankline.nvim"

    -- Fuzzy finding & Telescope --
    use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance

    -- Autocompletion --
    use("hrsh7th/nvim-cmp") -- completion plugin
    use("hrsh7th/cmp-buffer") -- source for text in buffer
    use("hrsh7th/cmp-path") -- source for file system paths

    -- Snippets --
    use("L3MON4D3/LuaSnip") -- snippet engine
    use("saadparwaiz1/cmp_luasnip") -- for autocompletion
    use("rafamadriz/friendly-snippets") -- useful snippets

    -- Managing & installing LSP servers, linters & formatters --
    use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
    use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

    -- Configuring LSP servers
    use("neovim/nvim-lspconfig") -- easily configure language servers
    use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
    use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
    use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

    -- Treesitter configuration --
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
        end,
    })
    use 'nvim-treesitter/nvim-treesitter-context'

    -- Auto closing --
    use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...

    -- Git integration --
    use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

    -- Dashboard --
    use "glepnir/dashboard-nvim"

    -- Managing upper Tab --
    use 'romgrk/barbar.nvim'

    -- Carbon colorscheme --
    use {'nyoom-engineering/oxocarbon.nvim'}

    use "anuvyklack/pretty-fold.nvim"

    if packer_bootstrap then
    require("packer").sync()
  end
end)
