-- Open explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open Explorer" })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Window management
vim.api.nvim_set_keymap("n", "<leader>v", ":vsplit<CR>", { noremap = true, silent = true, desc = "Vertical Split" })
vim.api.nvim_set_keymap("n", "<leader>h", ":split<CR>", { noremap = true, silent = true, desc = "Horizontal Split" })
vim.api.nvim_set_keymap("n", "<leader>wd", ":close<CR>", { noremap = true, silent = true })

-- Maximize the current vertical split
vim.api.nvim_set_keymap(
	"n",
	"<leader>wm",
	":wincmd |<CR>",
	{ noremap = true, silent = true, desc = "Maximize current vertical split" }
)

-- Restore all splits to equal size
vim.api.nvim_set_keymap(
	"n",
	"<leader>we",
	":wincmd =<CR>",
	{ noremap = true, silent = true, desc = "Restore all splits to equal size" }
)

-- Tab management
vim.keymap.set("n", "te", ":tabedit")
vim.keymap.set("n", "<tab>", ":tabnext<Return>", { noremap = true, silent = true })
vim.keymap.set("n", "<s-tab>", ":tabprev<Return>", { noremap = true, silent = true })

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Buffers navigation & management
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bd", ":bnext | bdelete #<CR>", { desc = "Delete buffer but keep window" })
vim.keymap.set("n", "<leader>bD", "<cmd>%bd|e#|bd#<cr>", { desc = "Close all buffers except current" })
vim.keymap.set("n", "<leader>wD", "<cmd>only<cr>", { desc = "Close all other windows" })
vim.keymap.set("n", "<leader>wd", "<cmd>close<cr>", { desc = "Close window" })

-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Don't copy when pasting over selection
-- vim.keymap.set("x", "p", [["_dP]], { desc = "Paste without overwriting clipboard" })

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

vim.keymap.set("n", "<leader>cd", function()
	vim.diagnostic.open_float(nil, { focusable = true })
end, { desc = "Show diagnostic (focusable)" })
vim.keymap.set(
	"n",
	"gv",
	"<cmd>vsplit | lua vim.lsp.buf.definition()<CR>",
	{ desc = "Go to definition in vertical split" }
)

vim.keymap.set("n", "<leader>qq", "<cmd>qa<CR>", { desc = "Quit all" })

-- Lazygit
vim.g.lazygit_use_custom_config_file_path = 1
vim.g.lazygit_config_file_path = {
	-- vim.fn.expand("~/.config/lazygit/config.yml"),
	vim.fn.expand("~/.config/lazygit/config.nvim.yml"),
}
