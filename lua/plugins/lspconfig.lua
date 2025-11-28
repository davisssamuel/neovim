return {
	"neovim/nvim-lspconfig",
	config = function()
		local servers = {
			"bashls",
			"biome",
			"clangd",
			"gopls",
			"jdtls",
			"lua_ls",
			"pyright",
			"ruff",
			"rust_analyzer",
			"ts_ls",
			"zls",
		}
		vim.lsp.enable(servers)

		local capabilities = require("blink.cmp").get_lsp_capabilities()
		vim.lsp.config("*", { capabilities = capabilities })
	end
}
