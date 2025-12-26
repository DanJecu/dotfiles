return {
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
}
