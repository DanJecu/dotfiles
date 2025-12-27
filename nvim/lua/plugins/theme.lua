return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			transparent_mode = true,
			overrides = {
				SignColumn = { bg = "none" },
			},
			styles = {
				comments = { italic = false },
				contrast = "hard",
			},
		})

		vim.cmd.colorscheme("gruvbox")
	end,
}
