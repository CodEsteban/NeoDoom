require('plugs')
require('plugins/gruvbox')
require('plugins/dash')
require('core/keymaps')

require("mason").setup()
require("plugins/lsp")
require('hardline').setup {}
local folder_path = vim.api.nvim_eval("expand('~')")
vim.cmd("source" .. folder_path .. "/.config/nvim/light.vim")
require("harpoon").setup(
	{
		menu = {
			width = 40
		}
	}
)
-- vim.api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
 vim.o.completeopt = "menuone,noselect,menuone"
-- vim.api.nvim_command('inoremap <C-space> <C-x><C-o>')
require('core/general')
require('plugins/which-key')
require('trouble').setup()
local tele = require("telescope")
local fb_actions = tele.extensions.file_browser.actions
tele.load_extension "file_browser"
local tele_actions = require "telescope.actions"

require("which-key").setup {

	key_labels = {
		["<leader>"] = "SPC",
		["<cr>"] = "RET",
		["<tab>"] = "TAB",
	},
	icons = {
		separator = "->",
		group = "+ ",
	},
	window = {
		margin = { 0, 3, 2, 3 },
		padding = { 2, 2, 2, 2 },
	},
	triggers = "<leader>"
}
require('telescope').setup {
	extensions = {
		file_browser = {
			hijack_netrw = true,
		},
	},
}
require("plugins/lsp")
require 'nvim-treesitter'.setup()
