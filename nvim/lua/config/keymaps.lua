-- Map Ctrl-A to select everything
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select All" })

-- Open explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open Explorer" })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Window management
vim.api.nvim_set_keymap("n", "<leader>v", ":vsplit<CR>", { noremap = true, silent = true, desc = "Vertical Split" })
vim.api.nvim_set_keymap("n", "<leader>h", ":split<CR>", { noremap = true, silent = true, desc = "Horizontal Split" })
vim.api.nvim_set_keymap("n", "<leader>wd", ":close<CR>", { noremap = true, silent = true })

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Buffers navigation & management
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bD", "<cmd>%bd|e#|bd#<cr>", { desc = "Close all buffers except current" })
vim.keymap.set("n", "<leader>wD", "<cmd>only<cr>", { desc = "Close all other windows" })
vim.keymap.set("n", "<leader>wd", "<cmd>close<cr>", { desc = "Close window" })

-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Don't copy when pasting over selection
vim.keymap.set("v", "p", '"_dP')

-- Copy relative path and line numeber on cursor
vim.keymap.set("n", "<leader>cp", function()
	local file = vim.fn.expand("%") -- Get relative file path
	local line = vim.fn.line(".") -- Get current line number
	local result = file .. ":" .. line
	vim.fn.setreg("+", result) -- Copy to system clipboard
	print("Copied: " .. result)
end, { desc = "Copy relative file path with line number" })

-- Open commit url
vim.keymap.set("n", "<leader>gc", ":GitBlameOpenCommitURL<CR>", { desc = "[G]it Open [C]ommit URL" })

-- Open diagnostic float
vim.keymap.set(
	"n",
	"<leader>cd",
	vim.diagnostic.open_float,
	{ noremap = true, silent = true, desc = "Hover Diagnostics" }
)

-- Lazygit
vim.g.lazygit_use_custom_config_file_path = 1
vim.g.lazygit_config_file_path = {
	-- vim.fn.expand("~/.config/lazygit/config.yml"),
	vim.fn.expand("~/.config/lazygit/config.nvim.yml"),
}
