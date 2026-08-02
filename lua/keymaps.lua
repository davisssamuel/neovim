vim.g.mapleader = " "
local map = vim.keymap.set

-- Indenting selections
map("v", "<", "<gv", {})
map("v", ">", ">gv", {})

-- Moving selections
map("v", "J", ":m '>+1<CR>gv=gv", {})
map("v", "K", ":m '<-2<CR>gv=gv", {})

-- Clear search highlighting
map("n", "<C-c>", ":nohl<CR>", {})

-- Format current buffer or selection
map({ "n", "v" }, "<leader>f", function()
	if vim.fn.mode() == "v" or vim.fn.mode() == "V" then
		vim.lsp.buf.format({
			range = { vim.fn.getpos("v"), vim.fn.getpos(".") },
		})
	else
		vim.lsp.buf.format()
	end
end, { desc = "Format current buffer or selection" })


vim.keymap.set({ "n", "v" }, "<leader>r", vim.lsp.buf.rename, { desc = "Rename current symbol" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Perform a code action" })

-- Open oil buffer
vim.keymap.set("n", "-", "<CMD>Oil<CR>", {})
