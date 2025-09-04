return {
	"projekt0n/github-nvim-theme",
	lazy = false,
	priority = 1000,
	config = function()
		require("github-theme").setup({
			options = {
				transparent = true,
			}
		})
		vim.api.nvim_win_set_option(0, "winhighlight", "NormalFloat:Normal,FloatBorder:FloatBorder")
		vim.api.nvim_set_hl(0, "LazyNormal", { bg = "#22272E" })
		vim.cmd.colorscheme("github_dark_dimmed")
	end,
}
