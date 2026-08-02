vim.opt.termguicolors = true

vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.inccommand = "split"
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.laststatus = 3 -- single statusline across L/R splits
vim.opt.cmdheight = 0  -- single statusline at bottom of editor

vim.opt.ignorecase = true
vim.opt.smartcase = true -- search is case insensitive for lowercase, case sensitive for uppercase

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.fn.mkdir(vim.opt.undodir:get()[1], "p")

vim.opt.clipboard:append("unnamedplus") -- append yanked text to system clipboard

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked text object",
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 100, visual = true })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Disable auto-continue comment on new line",
	group = vim.api.nvim_create_augroup("disable_auto_comment", {}),
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

vim.api.nvim_create_autocmd("VimResized", {
	desc = "Auto resize splits when terminal window is resized",
	group = vim.api.nvim_create_augroup("resize_splits", {}),
	command = "wincmd =",
})

vim.diagnostic.config({
	virtual_lines = { current_line = true }
})
