return {
	{ -- colorscheme
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("onedark").setup({
				-- transparent = true,
				colors = {
					fg = "#d3d3d3",
				},
				highlights = {
					-- Brackets, parentheses, braces in banana yellow
					["@punctuation.bracket"] = { fg = "#d3d3d3" },
					["@punctuation.delimiter"] = { fg = "#d3d3d3" },
					["Delimiter"] = { fg = "#d3d3d3" },
					["MatchParen"] = { fg = "#d3d3d3", bold = true },
				},
			})
			require("onedark").load()
		end,
	},
	{ -- git related signs to the gutter, as well as utilities for managing changes
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
		},
		config = function()
			local git_blame = require("gitblame")
			local filetype = { "filetype", icon_only = true }

			local diagnostics = {
				"diagnostics",
				sources = { "nvim_diagnostic" },
				sections = { "error", "warn", "info", "hint" },
				symbols = {
					error = " ",
					hint = " ",
					info = " ",
					warn = " ",
				},
				colored = true,
				update_in_insert = false,
				always_visible = false,
			}

			local diff = {
				"diff",
				source = function()
					local gitsigns = vim.b.gitsigns_status_dict
					if gitsigns then
						return {
							added = gitsigns.added,
							modified = gitsigns.changed,
							removed = gitsigns.removed,
						}
					end
				end,
				symbols = {
					added = "" .. " ",
					modified = "" .. " ",
					removed = "" .. " ",
				},
				colored = true,
				always_visible = false,
			}

			require("lualine").setup({
				options = {
					globalstatus = true,
					section_separators = {},
					component_separators = {},
				},
				sections = {
					lualine_b = {},
					lualine_c = {
						{
							"filename",
							path = 1,
						},
					},
					lualine_x = {
						diff,
						diagnostics,
						{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
					},
				},
			})
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({
				options = {
					mode = "tabs",
					-- separator_style = "slant",
					show_buffer_close_icons = false,
					show_close_icon = false,
				},
			})
		end,
	},
	{
		"b0o/incline.nvim",
		event = "BufReadPre",
		priority = 1200,
		config = function()
			require("incline").setup({
				highlight = {
					groups = {
						-- InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
						-- InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
					},
				},
				window = { margin = { vertical = 0, horizontal = 1 } },
				hide = {
					cursorline = true,
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if vim.bo[props.buf].modified then
						filename = "[+] " .. filename
					end

					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { " " }, { filename } }
				end,
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
