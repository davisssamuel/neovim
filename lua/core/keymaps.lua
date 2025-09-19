vim.g.mapleader = " "
local map = vim.keymap.set

-- LSP keybinds
map({ "n", "v" }, "<leader>f", vim.lsp.buf.format, { desc = "Format current buffer" })
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

-- Oil keybinds
map("n", "-", "<CMD>Oil<CR>", {})

-- Telescope keybinds
map("n", "<C-p>", function()
	require("fzf-lua").files()
end, {})

map("n", "<C-f>", function()
	require("fzf-lua").grep_curbuf()
end, {})

-- map("n", "<leader>ca", function()
-- 	require("fzf-lua").lsp_code_actions()
-- end, {})
