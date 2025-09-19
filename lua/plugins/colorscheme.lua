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

		-- vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "#444C56" })
		-- vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#444C56", bg = "#444C56" })
		-- vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#444C56", bg = "#444C56" })
		-- vim.api.nvim_set_hl(0, "BlinkCmpScrollBarThumb", { bg = "#444C56" })

		local hl_groups = {
			"BlinkCmpMenu",
			"BlinkCmpMenuBorder",
			"BlinkCmpDocBorder",
			"BlinkCmpScrollBarThumb",
			"FloatBorder",
			-- "FzfLuaBorder",
			-- "FzfLuaFzfBorder",
			-- "FzfLuaPreviewBorder",
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

		-- Set colors for floating windows for Oil 
		vim.api.nvim_win_set_option(0, "winhighlight", "NormalFloat:Normal,FloatBorder:FloatBorder")
		vim.cmd.colorscheme("github_dark_dimmed")
	end,
}
