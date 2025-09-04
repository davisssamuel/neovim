-- Configure markdown file rendering
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.spell = true -- Enable spell checking in markdown files
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true -- Break by word rather than character
		vim.opt_local.textwidth = 0 -- No fixed textwidth for visual wrapping
		vim.opt_local.wrapmargin = 0 -- No fixed wrapmargin for visual wrapping

		-- Navigate visual lines
		vim.keymap.set("n", "j", function()
			return vim.v.count == 0 and "gj" or "j"
		end, { expr = true, silent = true })

		vim.keymap.set("n", "k", function()
			return vim.v.count == 0 and "gk" or "k"
		end, { expr = true, silent = true })
	end,
})
