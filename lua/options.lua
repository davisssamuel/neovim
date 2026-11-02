-- Appearance
vim.opt.termguicolors = true
vim.opt.winborder = "none"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

vim.opt.laststatus = 3 -- single statusline across left/right splits
vim.opt.cmdheight = 0 -- single statusline at bottom of editor

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.smartindent = true

-- Window
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.inccommand = "split"
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true -- search is case insensitive for lowercase, case sensitive for uppercase

-- Files and undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

local undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undodir = undodir
vim.fn.mkdir(undodir, "p")

-- Clipboard
vim.opt.clipboard:append("unnamedplus") -- append yanked text to system clipboard

-- Other
vim.opt.exrc = true
vim.opt.secure = false

-- Diagnostics
vim.diagnostic.config({
	virtual_lines = { current_line = true },
})

-- Hightlight yanked text object
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight yanked text object",
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function() vim.highlight.on_yank({ timeout = 100, visual = true }) end,
})

-- Disable auto comment continuation
vim.api.nvim_create_autocmd("FileType", {
	desc = "Disable auto-continue comment on new line",
	group = vim.api.nvim_create_augroup("disable_auto_comment", {}),
	callback = function() vim.opt_local.formatoptions:remove({ "c", "r", "o" }) end,
})

-- Auto resize splits when terminal is resized
vim.api.nvim_create_autocmd("VimResized", {
	desc = "Auto resize splits when terminal window is resized",
	group = vim.api.nvim_create_augroup("resize_splits", {}),
	command = "wincmd =",
})

-- Markdown and LaTeX settings
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("text_file_settings", { clear = true }),
	pattern = { "markdown", "tex" },
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true -- Break by word rather than character
		vim.opt_local.textwidth = 0 -- No fixed textwidth for visual wrapping
		vim.opt_local.wrapmargin = 0 -- No fixed wrapmargin for visual wrapping

		-- Navigate visual lines
		vim.keymap.set("n", "j", function() return vim.v.count == 0 and "gj" or "j" end, {
			expr = true,
			silent = true,
			buffer = true,
		})

		vim.keymap.set("n", "k", function() return vim.v.count == 0 and "gk" or "k" end, {
			expr = true,
			silent = true,
			buffer = true,
		})
	end,
})
