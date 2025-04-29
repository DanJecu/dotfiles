return {
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme onedark]])
		end,
	},
	{
		-- Git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				vim.keymap.set("n", "]h", function()
					require("gitsigns").nav_hunk("next")
				end, { buffer = bufnr, desc = "Next Git Hunk" })

				vim.keymap.set("n", "[h", function()
					require("gitsigns").nav_hunk("prev")
				end, { buffer = bufnr, desc = "Previous Git Hunk" })
			end,
		},
	},
	{
		"f-person/git-blame.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.g.gitblame_display_virtual_text = 0
			vim.g.gitblame_message_template = "<author> • <date>"
			vim.g.gitblame_date_format = "%r" -- relative time format
		end,
	},
	{ -- Lualine Configuration
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"SmiteshP/nvim-navic", -- Make sure navic is loaded
		},
		config = function()
			local git_blame = require("gitblame")
			local navic = require("nvim-navic")

			require("lualine").setup({
				options = {
					globalstatus = true,
				},
				sections = {
					lualine_c = {
						{
							"filename",
							path = 1,
						},
						{
							function()
								return navic.is_available() and navic.get_location() or ""
							end,
							cond = function()
								return package.loaded["nvim-navic"] and navic.is_available()
							end,
						},
						{ "searchcount", maxcount = 999999 },
					},
					lualine_x = {
						{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
					},
				},
			})
		end,
	},
	{ -- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = "ibl",
		opts = {},
	},
}
