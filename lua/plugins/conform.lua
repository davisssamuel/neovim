return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang_format" },
				go = { "goimports", "gofmt" },
				lua = { "stylua" },
				python = { "ruff" },
				zig = { "zigfmt" }
			},

			formatters = {
				zigfmt = {
					command = "zig",
					args = { "fmt", "--stdin" },
					stdin = true,
				}
			},

			default_format_opts = { lsp_format = "fallback", },
		})
	end
}
