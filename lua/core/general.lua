vim.o.number = true
vim.api.nvim_set_option('timeoutlen', 0)
vim.o.relativenumber = true
vim.cmd("set undofile")
vim.opt.undodir = os.getenv("HOME") .. '/.config/nvim/undo'
vim.cmd("set nowrap")
vim.diagnostic.config({ virtual_text = false })
