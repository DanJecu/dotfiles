return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	opts = {
		ensure_installed = {
			"dockerfile",
			"css",
			"html",
			"go",
			"javascript",
			"json",
			"lua",
			"luadoc",
			"scss",
			"sql",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		},
		auto_tag = {
			enable = true,
		},
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.install").prefer_git = true
		require("nvim-treesitter.configs").setup(opts)
	end,
}
