require('plugs')
require('plugins/gruvbox')
require('core/keymaps')
require("harpoon").setup()
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "rust_analyzer" }
})
require'lspconfig'.sumneko_lua.setup{}
require'lspconfig'.rust_analyzer.setup{}
require('core/general')
require('plugins/nest')
require('plugins/which-key')
require('trouble').setup()
local tele = require("telescope")
local fb_actions = tele.extensions.file_browser.actions
tele.load_extension "file_browser"
local tele_actions = require "telescope.actions"

require("which-key").setup{

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
