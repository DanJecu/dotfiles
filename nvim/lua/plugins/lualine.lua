return { -- Lualine Configuration
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
					diff,
					diagnostics,
					{
						"filename",
						path = 1,
					},
				},
				lualine_x = {
					{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
				},
			},
		})
	end,
}
