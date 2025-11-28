return {
	"saghen/blink.pairs",
	version = "*",
	dependencies = "saghen/blink.download",
	config = function()
		require("blink.pairs").setup({
			highlights = { enabled = false },
		})
	end
}
