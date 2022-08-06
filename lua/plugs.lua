local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
	use {
	    "wbthomason/packer.nvim",
	    "ellisonleao/gruvbox.nvim",
	    "folke/trouble.nvim",
	    'kyazdani42/nvim-web-devicons',
	    "folke/which-key.nvim" ,
	    'ThePrimeagen/harpoon',
	    'nvim-telescope/telescope.nvim', tag = '0.1.0',
	    'nvim-lua/plenary.nvim',
	    "nvim-telescope/telescope-file-browser.nvim",
	    'neovim/nvim-lspconfig'
    }
    use { "williamboman/mason.nvim" }
    use { 'nvim-treesitter/nvim-treesitter'}
    --   use {
    --      'neoclide/coc.nvim', branch = 'release'
    --   }
use {'glepnir/dashboard-nvim'}
    use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
  require("toggleterm").setup()
end}
  if packer_bootstrap then
    require('packer').sync()
  end
end)
