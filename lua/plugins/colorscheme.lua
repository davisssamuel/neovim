return {
	"projekt0n/github-nvim-theme",
	lazy = false,
	priority = 1000,
	config = function()
		require("github-theme").setup({
			options = { transparent = true },
		})

		-- TODO: finish defining colors
		local colors = {
			default = {
				fg = "",
				bg = "",
				border = "",
				cursor = "",
			},
			dimmed = {
				fg = "",
				bg = "#22272E",
				border = "#444C56",
				cursor = "",
			},
			light = {
				fg = "",
				bg = "#FFFFFF",
				border = "#D0D7DE",
				cursor = "#E6EAF0",
			}
		}

		local hl_groups = {
			"BlinkCmpDetail",
			"BlinkCmpDocBorder",
			"BlinkCmpLabelDescription",
			"BlinkCmpLabelDetail",
			"BlinkCmpMenu",
			"BlinkCmpMenuBorder",
			"FloatBorder",
			"LazyNormal",
			"NormalFloat",
		}

		-- Iterate through highlight groups and set background/border colors
		for _, group in ipairs(hl_groups) do
			if group:match("Border$") then
				vim.api.nvim_set_hl(0, group, { fg = colors.light.border, bg = colors.light.bg })
			else
				vim.api.nvim_set_hl(0, group, { bg = colors.light.bg })
			end
		end

		-- Set colors for oil.nvim floating windows
		vim.api.nvim_win_set_option(0, "winhighlight", "NormalFloat:Normal,FloatBorder:FloatBorder")

		-- Set cursorline and enable colorscheme
		vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.light.cursor })
		vim.cmd.colorscheme("github_light")
	end,
}
