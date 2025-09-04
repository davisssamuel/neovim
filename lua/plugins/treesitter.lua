return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"c",
				"go",
				"lua",
				"javascript",
				"typescript",
				"json",
				"markdown",
				"python",
				"vim",
				"vimdoc",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						-- You can use the capture groups defined in textobjects.scm
						["af"] = { query = "@function.outer",		desc = "around a function" },
						["if"] = { query = "@function.inner",		desc = "inner part of a function" },
						["ac"] = { query = "@class.outer",			desc = "around a class" },
						["ic"] = { query = "@class.inner",			desc = "inner part of a class" },
						["ai"] = { query = "@conditional.outer",	desc = "around an if statement" },
						["ii"] = { query = "@conditional.inner",	desc = "inner part of an if statement" },
						["al"] = { query = "@loop.outer",			desc = "around a loop" },
						["il"] = { query = "@loop.inner",			desc = "inner part of a loop" },
						["ap"] = { query = "@parameter.outer",		desc = "around parameter" },
						["ip"] = { query = "@parameter.inner",		desc = "inside a parameter" },
					},
					selection_modes = {
						["@parameter.outer"] = "v",       -- charwise
						["@parameter.inner"] = "v",       -- charwise
						["@function.outer"] = "v",        -- charwise
						["@conditional.outer"] = "V",     -- linewise
						["@loop.outer"] = "V",            -- linewise
						["@class.outer"] = "<c-v>",       -- blockwise
					},
				},
				move = {
					enable = true,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_previous_start = {
						["[f"] = { query = "@function.outer",	desc = "previous function" },
						["[c"] = { query = "@class.outer",		desc = "previous class" },
						["[p"] = { query = "@parameter.inner",	desc = "previous parameter" },
					},
					goto_next_start = {
						["]f"] = { query = "@function.outer",	desc = "next function" },
						["]c"] = { query = "@class.outer",		desc = "next class" },
						["]p"] = { query = "@parameter.inner",	desc = "next parameter" },
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>a"] = "@parameter.inner",
					},
					swap_previous = {
						["<leader>A"] = "@parameter.inner",
					},
				},
			},
		})
	end,
}
