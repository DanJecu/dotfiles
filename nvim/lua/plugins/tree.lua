return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	keys = {
		{ "<leader>ff", "<cmd>NvimTreeFindFile<cr>", desc = "Find file in filetree" },
		{ "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Find file in filetree" },
	},
	opts = {
		filters = {
			custom = { ".git", "node_modules", ".vscode" },
			dotfiles = true,
		},
		git = {},
		view = {
			adaptive_size = true,
			float = {
				enable = true,
			},
		},
	},
}
