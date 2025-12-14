return { -- git related signs to the gutter, as well as utilities for managing changes
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
}
