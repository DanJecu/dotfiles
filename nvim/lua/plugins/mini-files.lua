return {
		-- Explorer
		"echasnovski/mini.files",
		version = "*",
		config = function()
			local MiniFiles = require("mini.files")
			MiniFiles.setup({
				options = { use_as_default_explorer = true },
content = {
    filter = function(name, _)
      return true
    end,
  },
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
