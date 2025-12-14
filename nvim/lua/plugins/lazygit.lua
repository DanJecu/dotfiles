return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
	},
	config = function()
		-- Override LazyGit settings
		vim.g.lazygit_config = {
			-- Custom edit commands to use Neovim's remote capabilities
			edit = "nvim --server $NVIM --remote-send '<cmd>close<cr><cmd>lua EditFromLazygit([[{{filename}}]])<CR>'",
			editAtLine = "nvim --server $NVIM --remote-send '<cmd>close<CR><cmd>lua EditLineFromLazygit([[{{filename}}]],{{line}})<CR>'",
		}

		-- Define the Lua functions for handling the edits
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				-- Function to edit a file at a specific line
				_G.EditLineFromLazygit = function(file_path, line)
					local current_path = vim.fn.expand("%:p")
					if current_path == file_path then
						vim.cmd(tostring(line))
					else
						vim.cmd("e " .. file_path)
						vim.cmd(tostring(line))
					end
				end

				-- Function to edit a file without a specific line
				_G.EditFromLazygit = function(file_path)
					local current_path = vim.fn.expand("%:p")
					if current_path ~= file_path then
						vim.cmd("e " .. file_path)
					end
				end
			end,
		})
	end,
}
