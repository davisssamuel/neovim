vim.g.mapleader = " "

-- Indenting selections
vim.keymap.set("v", "<", "<gv", {})
vim.keymap.set("v", ">", ">gv", {})

-- Moving selections
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {})

-- Clear search highlighting
vim.keymap.set("n", "<C-c>", ":nohl<CR>", {})

-- Format current buffer or selection
vim.keymap.set({ "n", "x" }, "<leader>f", function()
	require("conform").format({
		async = true,
		lsp_format = "fallback",
	})
end, { desc = "Format current buffer or selection" })

vim.keymap.set({ "n", "v" }, "<leader>r", vim.lsp.buf.rename, { desc = "Rename current symbol" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Perform a code action" })

-- Open Oil buffer
vim.keymap.set("n", "-", "<CMD>Oil<CR>", {})
