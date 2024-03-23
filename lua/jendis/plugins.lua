-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	--Telescoppe
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	
	-- Color Schema
	use ({ "rose-pine/neovim", as = "rose-pine" })

	-- Neo Vim Tree sitter
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	
	-- Harpoon
	use('nvim-lua/plenary.nvim')
	use('ThePrimeagen/harpoon')
	
	-- Undotree
	use 'mbbill/undotree'
	use 'tpope/vim-fugitive'
end)
