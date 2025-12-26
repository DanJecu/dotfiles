return { -- Highlight, edit, and navigate code
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"css",
				"go",
				"html",
				"lua",
				"tsx",
				"typescript",
			},
			auto_install = true,
			highlight = {
				enable = true,
			},
		},
		config = function(_, opts)
			require("nvim-treesitter").setup(opts)
		end,
	},
	{
		"SmiteshP/nvim-navic",
		lazy = true,
		init = function()
			vim.g.navic_silence = true
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					local bufnr = args.buf
					if client and client.server_capabilities.documentSymbolProvider then
						require("nvim-navic").attach(client, bufnr)
					end
				end,
			})
		end,
		opts = function()
			return {
				separator = " » ",
				highlight = true,
				depth_limit = 5,
				lazy_update_context = true,
			}
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "VeryLazy",
		config = function()
			require("treesitter-context").setup({
				enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
				max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
				trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
				zindex = 20, -- The Z-index of the context window
			})
		end,
	},
}
