return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.enable({
			"lua_ls",
			"nixd",
		})

		-- Add LSP capabilities to blink for every language server
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		vim.lsp.config("*", {
			capabilities = capabilities,
		})
	end
}
