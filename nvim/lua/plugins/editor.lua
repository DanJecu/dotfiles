return {
	{ -- Find files
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			winopts = {
				preview = { layout = "vertical" },
			},
			files = {
				cmd = "fd --type f --hidden --exclude node_modules --exclude .nx",
				formatter = "path.filename_first",
				cwd_prompt = false,
				hidden = true,
			},
			keymap = {
				fzf = {
					["ctrl-l"] = "select-all+accept",
				},
			},
		},
		keys = {
			{
				"<leader>/",
				function()
					require("fzf-lua").live_grep()
				end,
				desc = "Live Grep (fzf-lua)",
			},
			{
				"<leader>fq",
				function()
					require("fzf-lua").grep_quickfix()
				end,
				desc = "[F]ind [Q]uickfix",
			},
			{
				"<C-p>",
				function()
					require("fzf-lua").files()
				end,
				desc = "Find Files",
			},
			{
				"<leader><leader>",
				function()
					require("fzf-lua").buffers()
				end,
				desc = "[F]ind Open Buffers",
			},
			{
				"<leader>gh",
				function()
					require("fzf-lua").git_stash()
				end,
				desc = "[G]it Stas[h]",
			},
			{
				"<leader>fm",
				function()
					require("fzf-lua").marks()
				end,
				desc = "[F]ind [M]arks",
			},
			{
				"<leader>fw",
				function()
					require("fzf-lua").grep_cWORD()
				end,
				desc = "[F]ind [W]ord",
			},
		},
	},
	{ -- Autoformat
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = "",
				desc = "[C]ode [F]ormat Buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = {
				-- I recommend these options. See :help conform.format for details.
				lsp_format = "fallback",
				timeout_ms = 500,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				-- javascript = { 'prettierd', 'prettier', stop_after_first = true },
				-- typescript = { 'prettierd', 'prettier', stop_after_first = true },
				-- javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
				-- typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
			},
		},
	},
}
