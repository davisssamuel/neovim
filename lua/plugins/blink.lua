return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "v0.*",
	config = function()
		require("blink.cmp").setup({
			keymap = { preset = "default" },
			appearance = { nerd_font_variant = "mono" },
			signature = { enabled = true },
			-- sources = {
			-- 	providers = {
			-- 		markdown = {
			-- 			name = 'RenderMarkdown',
			-- 			module = 'render-markdown.integ.blink',
			-- 			fallbacks = { 'lsp' },
			-- 		},
			-- 	}
			-- }
		})
	end
}
