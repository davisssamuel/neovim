-- Appearance
vim.o.wrap = false
vim.o.number = true
vim.o.cursorline = true
vim.o.splitright = true
vim.o.winborder = "none"
vim.o.signcolumn = "yes"

-- Indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = true

-- LSP diagnostics appearance
vim.diagnostic.config({
	virtual_lines = { current_line = true }
})
