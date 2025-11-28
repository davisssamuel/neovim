-- Highlight yanked object
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	pattern = "*",
	desc = "Highlight selection on yank",
	callback = function()
		vim.highlight.on_yank({ timeout = 100, visual = true })
	end,
})

-- Disable auto-continue comment on new line
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("no_auto_comment", {}),
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- Auto resize splits when terminal window is resized
vim.api.nvim_create_autocmd("VimResized", {
	command = "wincmd =",
})

-- Wrap markdown files and navigate on visual lines
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true 	-- Break by word rather than character
		vim.opt_local.textwidth = 0 	-- No fixed textwidth for visual wrapping
		vim.opt_local.wrapmargin = 0 	-- No fixed wrapmargin for visual wrapping

		-- Navigate visual lines
		vim.keymap.set("n", "j", function()
			return vim.v.count == 0 and "gj" or "j"
		end, { expr = true, silent = true })

		vim.keymap.set("n", "k", function()
			return vim.v.count == 0 and "gk" or "k"
		end, { expr = true, silent = true })
	end,
})
