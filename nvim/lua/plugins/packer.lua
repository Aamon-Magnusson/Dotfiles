local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use { 'wbthomason/packer.nvim' }
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.x',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use {
		"theprimeagen/harpoon",
		branch = "harpoon2",
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use { 'mbbill/undotree' }
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
	}
	use { 'Mofiqul/dracula.nvim' }
	vim.cmd [[colorscheme dracula]]
	use { 'kyazdani42/nvim-web-devicons' }
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use { "folke/which-key.nvim" }
	use { 'm4xshen/autoclose.nvim' }
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		--tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	use {
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	}
	use { 'lukas-reineke/indent-blankline.nvim' }
	require("ibl").setup {
		scope = { enabled = true },
	}
	use { "alec-gibson/nvim-tetris" }
	use { "beauwilliams/focus.nvim", config = function() require("focus").setup() end }
	use { "folke/twilight.nvim" }
	use { "folke/zen-mode.nvim", config = function () require("zen-mode").setup({
		-- configuration here, or leave empty to use defaults
	}) end }
	use {
		"FabijanZulj/blame.nvim",
		config = function()
			require("blame").setup()
		end
	}
	use { "airblade/vim-gitgutter" }
	use { "norcalli/nvim-colorizer.lua" }
	require("colorizer").setup()

	if packer_bootstrap then
		require('packer').sync()
	end
end)
