return { -- Collection of various small independent plugins/modules
	"nvim-mini/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		-- Explorer
		local MiniFiles = require("mini.files")
		MiniFiles.setup({
			options = { use_as_default_explorer = true },
		})

		vim.keymap.set("n", "<leader>pe", function()
			MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
			MiniFiles.reveal_cwd()
		end, { desc = "Open MiniFiles at current file's directory" })

		vim.keymap.set("n", "<leader>pE", function()
			require("mini.files").open()
		end, { desc = "Open MiniFiles" })
	end,
}
