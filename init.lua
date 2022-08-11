require('plugs')
require 'nvim-treesitter'.setup()
require('plugins/gruvbox')
require('plugins/dash')
require('core/keymaps')

require("gitsigns").setup {
	signcolumn = false
}


require "colorizer".setup()
require("mason").setup()
require("plugins/lsp")
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
require("plugins/lsp")
require('hardline').setup {
	bufferline = false, -- enable bufferline
	bufferline_settings = {
		exclude_terminal = false, -- don't show terminal buffers in bufferline
		show_index = false, -- show buffer indexes (not the actual buffer numbers) in bufferline
	},
	theme = 'default', -- change theme
	sections = { -- define sections
		{ class = 'mode', item = require('hardline.parts.mode').get_item },
		{ class = 'high', item = require('hardline.parts.git').get_item, hide = 100 },
		{ class = 'med', item = require('hardline.parts.filename').get_item },
		'%<',
		{ class = 'med', item = '%=' },
		{ class = 'low', item = require('hardline.parts.wordcount').get_item, hide = 100 },
		{ class = 'error', item = require('hardline.parts.lsp').get_error },
		{ class = 'warning', item = require('hardline.parts.lsp').get_warning },
		{ class = 'warning', item = require('hardline.parts.whitespace').get_item },
		{ class = 'high', item = require('hardline.parts.filetype').get_item, hide = 60 },
		{ class = 'mode', item = require('hardline.parts.line').get_item },
	},
}
require('telescope').setup {
	extensions = {
		file_browser = {
			hijack_netrw = true,
			theme = "ivy",
			layout_config = {
				height = 0.3
				-- other layout configuration here
			},
		},
	},
	pickers = {
		oldfiles = {
			theme = "ivy",
			layout_config = {
				height = 0.3
				-- other layout configuration here
			},
		},
		find_files = {
			theme = "ivy",
			layout_config = {
				height = 0.3
				-- other layout configuration here
			},
		},
		buffers = {
			theme = "ivy",
			layout_config = {
				height = 0.3
				-- other layout configuration here
			},

		},
		live_grep = {
			theme = "ivy",
			layout_config = {
				height = 0.3
				-- other layout configuration here
			},

		}
	},
}
require("telescope").load_extension "file_browser"
require 'marks'.setup {
}
