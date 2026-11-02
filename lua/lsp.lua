local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Apply capabilities to every LSP server
vim.lsp.config("*", {
	capabilities = capabilities,
})

-- Custom server configurations
vim.lsp.config("badness", {
	cmd = { "badness", "lsp" },
	filetypes = { "tex", "latex", "plaintex", "bib" },
	root_markers = { "badness.toml", ".git" },
	init_options = {
		lineWidth = 100,
		indentWidth = 4,
		wrap = "sentence",
	},
})

-- Enable LSP servers
vim.lsp.enable({
	"bashls",
	"biome",
	"clangd",
	"gopls",
	"lua_ls",
	"pyright",
	"ruff",
	"rust_analyzer",
	"badness",
})
