vim.g.mapleader = " "
local map = vim.keymap.set

-- LSP keybinds
map({ "n", "v" }, "<leader>f", function()
	if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
		vim.lsp.buf.format({
			range = { vim.fn.getpos("v"), vim.fn.getpos(".") },
		})
	else
		vim.lsp.buf.format()
	end
end, { desc = "Format current buffer or selection" })

map({ "n", "v" }, "<leader>r", vim.lsp.buf.rename, { desc = "Rename current symbol" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Perform a code action" })

-- Indenting selections
map("v", "<", "<gv", {})
map("v", ">", ">gv", {})

-- Moving selections
map("v", "J", ":m '>+1<CR>gv=gv", {})
map("v", "K", ":m '<-2<CR>gv=gv", {})

-- Moving between split windows
map({ "n", "v" }, "<C-h>", "<CMD>wincmd h<CR>", {})
map({ "n", "v" }, "<C-j>", "<CMD>wincmd j<CR>", {})
map({ "n", "v" }, "<C-k>", "<CMD>wincmd k<CR>", {})
map({ "n", "v" }, "<C-l>", "<CMD>wincmd l<CR>", {})

-- Oil keymaps 
map("n", "-", "<CMD>Oil<CR>", {})

-- FzfLua keymaps 
map("n", "<C-p>", function()
	require("fzf-lua").files()
end, { desc = "Search files" })

map("n", "<C-f>", function()
	require("fzf-lua").grep_curbuf()
end, { desc = "Search current buffer" })
