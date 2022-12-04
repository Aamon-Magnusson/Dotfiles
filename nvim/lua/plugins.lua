-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
		-- Treesitter
		--use 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

		use 'wbthomason/packer.nvim'

		-- LSP
		use 'neovim/nvim-lspconfig'
		use 'williamboman/mason.nvim'
		--This is deprecated, should try to figure out another autocomplete--
		use 'hrsh7th/nvim-compe'
		-- WIP
		-- use 'mhartington/formatter.nvim'

		-- Telescope!!!
		use 'nvim-lua/plenary.nvim'
		use 'nvim-telescope/telescope.nvim'

		-- Harpoon
		use 'ThePrimeagen/harpoon'

		-- See if I use this (Or am allowed to use this)
		use 'github/copilot.vim'

		-- Tpope
		use 'tpope/vim-surround'
		use 'tpope/vim-repeat'
		use 'glts/vim-radical'
		use 'glts/vim-magnum'

		-- Movement
		use 'easymotion/vim-easymotion'

		-- Markdown
		-- I might be able to take this out but it stays for now
		use 'davidgranstrom/nvim-markdown-preview'

		-- nice commenting
		use 'numToStr/Comment.nvim'

		-- show keybindings of leader
		use 'liuchengxu/vim-which-key'

		-- gitgutter
		use 'airblade/vim-gitgutter'

		-- pairs
		use 'jiangmiao/auto-pairs'

		-- Autotag
		-- use 'windwp/nvim-ts-autotag'
end)
