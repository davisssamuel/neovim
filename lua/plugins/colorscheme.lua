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

		local hl_groups = {
			"BlinkCmpMenu",
			"BlinkCmpMenuBorder",
			"BlinkCmpDocBorder",
			"BlinkCmpScrollBarThumb",
			"FloatBorder",
			"LazyNormal",
			"NormalFloat",
		}

		-- Iterate through highlight groups and set background and border colors 
		for _, group in ipairs(hl_groups) do
			if group:match("Border$") then
				vim.api.nvim_set_hl(0, group, { fg = "#444C56", bg = "#22272E" })
			else
				vim.api.nvim_set_hl(0, group, { bg = "#22272E" })
			end
		end

		-- Set colors for floating windows (Oil) 
		vim.api.nvim_win_set_option(0, "winhighlight", "NormalFloat:Normal,FloatBorder:FloatBorder")
		vim.cmd.colorscheme("github_dark_dimmed")
	end,
}
