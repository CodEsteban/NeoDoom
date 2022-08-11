local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then

	packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
	vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
	use {
		"wbthomason/packer.nvim",
		"ellisonleao/gruvbox.nvim",
		"folke/trouble.nvim",
		'kyazdani42/nvim-web-devicons',
		"folke/which-key.nvim",
		'ThePrimeagen/harpoon',
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		'L3MON4D3/LuaSnip',
		'nvim-lua/plenary.nvim',
		"nvim-telescope/telescope-file-browser.nvim",
		'neovim/nvim-lspconfig',
		'hrsh7th/cmp-nvim-lsp',
		'saadparwaiz1/cmp_luasnip'
	}
	use {
		'lewis6991/gitsigns.nvim',
	}
	use {
		'chentoast/marks.nvim',
	}
	use { 'ojroques/nvim-hardline' }
	use { 'feline-nvim/feline.nvim' }
	use { "williamboman/mason.nvim" }
	use { 'nvim-treesitter/nvim-treesitter' }
	use { 'dinhhuy258/vim-local-history',
		config = function() require("nvim-autopairs").setup {} end
	}
	use { 'norcalli/nvim-colorizer.lua',
	}
	use {
		'hrsh7th/nvim-cmp',
	}
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	use {
		"AckslD/nvim-neoclip.lua",
		config = function()
			require('neoclip').setup()
		end,
	}
	use { 'glepnir/dashboard-nvim' }
	use { "akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
		require("toggleterm").setup()
	end }
	if packer_bootstrap then
		require('packer').sync()
	end
end)
