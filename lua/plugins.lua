vim.pack.add({
	-- { src = "https://github.com/projekt0n/github-nvim-theme" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/navarasu/onedark.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/saghen/blink.pairs" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
})

-- local github_theme = require("github-theme")
-- github_theme.setup()
-- vim.cmd.colorscheme("github_light")

local onedark = require("onedark")
onedark.setup({ style = "light" })
onedark.load()

local oil = require("oil")
oil.setup({
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
	view_options = { show_hidden = true },
})

local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		c = { "clang_format" },
		go = { "goimports", "gofmt" },
		javascript = { "biome" },
		lua = { "stylua" },
		python = { "ruff" },
		rust = { "rust_analyzer" }
	},
	default_format_opts = { lsp_format = "fallback", },
})

local cmp = require("blink.cmp")
cmp.build():pwait()
cmp.setup()

local pairs = require("blink.pairs")
pairs.build():pwait(60000)
pairs.setup()

-- NOTE: must have tree-sitter and tree-sitter-cli installed
require("nvim-treesitter").install({
	"bash",
	"c",
	"go",
	"javascript",
	"lua",
	"python",
	"rust",
	"vimdoc",
})

vim.lsp.enable({
	"bashls",
	"biome",
	"clangd",
	"gopls",
	"lua_ls",
	"pyright",
	"ruff",
	"rust_analyzer",
})

local capabilities = cmp.get_lsp_capabilities()
vim.lsp.config("*", { capabilities = capabilities })
