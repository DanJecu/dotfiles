return {
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		opts = {
			styles = {
				bold = true,
				italic = true,
				transparency = true,
			},
		},
		config = function()
			vim.cmd.colorscheme("rose-pine-moon")
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},
}
