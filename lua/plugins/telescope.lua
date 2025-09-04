return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		require("telescope").load_extension("ui-select")
		require("telescope").setup({
			defaults = {
				layout_strategy = "flex",
				layout_config = {
					prompt_position = "top",
					vertical = { mirror = true }
				},
				sorting_strategy = "ascending",
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			},
			extensions = {
				["ui-select"] = require("telescope.themes").get_dropdown(),
			},
			-- pickers = {
			-- 	find_files = { disable_devicons = true },
			-- 	live_grep = { disable_devicons = true },
			-- },
		})
	end,
}
