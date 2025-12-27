return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("bufferline").setup({
			options = {
				-- mode = "tabs",
				-- separator_style = "slant",
				show_buffer_close_icons = false,
				show_close_icon = false,
				tab_size = 0,
				max_name_length = 100,
			},
		})
	end,
}
