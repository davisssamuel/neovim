return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local custom_theme = require("lualine.themes.auto")
		local custom_bg = "#22272E"
		custom_theme.normal.c.bg = custom_bg
		custom_theme.insert.c.bg = custom_bg
		custom_theme.visual.c.bg = custom_bg
		custom_theme.replace.c.bg = custom_bg
		custom_theme.command.c.bg = custom_bg
		custom_theme.inactive.c.bg = custom_bg
		require("lualine").setup({
			options = {
				theme = custom_theme,
				section_separators = "",
				component_separators = "",
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", },
				lualine_c = { "filename" },
				lualine_x = { "diagnostics" },
				lualine_y = { "progress" },
				lualine_z = { "location" }
			},
		})
	end
}
