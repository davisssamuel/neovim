return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.enable({
			"bashls",
			"biome",
			"clangd",
			"gopls",
			"lua_ls",
			"pyright",
			"ruff",
			"tsserver",
		})

		-- Add LSP capabilities to blink for every language server
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		-- Manually configure tsserver
		vim.lsp.config("tsserver", {
			cmd = { "typescript-language-server", "--stdio" },
			filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
		})

		-- Manually configure biome
		vim.lsp.config("biome", {
			cmd = { "biome", "lsp-proxy" },
		})

		-- Manually configure bashls
		vim.lsp.config("bashls", {
			cmd = { "bash-language-server", "start" },
			filetypes = { "bash", "sh" }
		})
	end
}
