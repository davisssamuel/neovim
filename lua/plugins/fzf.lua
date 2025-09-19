return {
	"ibhagwan/fzf-lua",
	config = function()
		require("fzf-lua").register_ui_select()
		require("fzf-lua").setup({
			"border-fused",
			winopts = {
				title_flags = false,
			},
			hls = {
				border = "FloatBorder",
				preview_border = "FloatBorder",
				scrollborder_f = "FloatBorder",
			},
			fzf_colors = {
				bg = { "bg", "Normal" },
				gutter = { "bg", "Normal" },
				info = { "fg", "Conditional" },
				scrollbar = { "bg", "Normal" },
				separator = { "fg", "Comment" },
			},
		})
	end
}
