-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Split window
vim.api.nvim_set_keymap("n", "<leader>v", ":vsplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>s", ":split<CR>", { noremap = true, silent = true })

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

-- Buffers navigation & management
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bd", ":bnext | bdelete #<CR>", { desc = "Delete buffer but keep window" })
vim.keymap.set("n", "<leader>bD", "<cmd>%bd|e#|bd#<cr>", { desc = "Close all buffers except current" })
vim.keymap.set("n", "<leader>wD", "<cmd>only<cr>", { desc = "Close all other windows" })
vim.keymap.set("n", "<leader>wd", "<cmd>close<cr>", { desc = "Close window" })

-- Copy relative path and line numeber on cursor
vim.keymap.set("n", "<leader>cp", function()
	local file = vim.fn.expand("%:p")
	local home = vim.fn.expand("~")
	local relative_path = file:gsub("^" .. vim.pesc(home) .. "/", "~/")
	local line = vim.fn.line(".")
	local result = relative_path .. ":" .. line
	vim.fn.setreg("+", result)
	print("Copied: " .. result)
end, { desc = "Copy file path with line number (from ~)" })

-- Open explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open Explorer" })

-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- Open commit url
vim.keymap.set("n", "<leader>gc", ":GitBlameOpenCommitURL<CR>", { desc = "[G]it Open [C]ommit URL" })
