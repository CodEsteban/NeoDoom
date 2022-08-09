local function map(mode, lhs, rhs, opts)
	local options = { noremap = false, silent = true }
	if opts then
		options = vim.tbl_extend('force', options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Clear selected
map('n', '<Esc><Esc>', ':nohl<CR>')
map('n', 'K', ':m -2<cr>')
map('n', 'J', ':m +1<cr>')
map('n', '<Tab>', ':lua vim.diagnostic.open_float()<cr>')
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]])
