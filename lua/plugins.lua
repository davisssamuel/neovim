vim.pack.add({
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/navarasu/onedark.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/saghen/blink.lib" },
	{ src = "https://github.com/saghen/blink.pairs" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
})

local onedark = require("onedark")
onedark.setup({
	style = "dark",
	transparent = true,
	highlights = {
		["@punctuation.bracket"] = { fmt = "none" },
		["@punctuation.brace"] = { fmt = "none" },
		["@constructor"] = { fg = "@punctuation.bracket", fmt = "none" },
	},
})
onedark.load()

local lualine = require("lualine")
lualine.setup({
	options = {
		component_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff" },
		lualine_c = { "filename" },
		lualine_x = { "diagnostics", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})

local oil = require("oil")
oil.setup({
	delete_to_trash = true,
	skip_confirm_for_simple_edits = true,
	view_options = { show_hidden = true },
})

local cmp = require("blink.cmp")
cmp.build():pwait()
cmp.setup()

local pairs = require("blink.pairs")
pairs.download():pwait(60000)
pairs.setup({
	highlights = {
		enabled = false,
	},
})

local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		c = { "clang_format" },
		go = { "goimports", "gofmt" },
		javascript = { "biome" },
		lua = { "stylua" },
		python = { "ruff_format" },
		rust = { "rustfmt" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
})

-- NOTE: must have tree-sitter and tree-sitter-cli installed
require("nvim-treesitter").install({
	"bash",
	"c",
	"go",
	"javascript",
	"latex",
	"lua",
	"python",
	"rust",
	"vimdoc",
})
