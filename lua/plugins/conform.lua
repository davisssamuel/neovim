return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				c = "clang_format",
				go = "gofmt",
				lua = "stylua",
				python = "ruff",
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
		})
	end
}
