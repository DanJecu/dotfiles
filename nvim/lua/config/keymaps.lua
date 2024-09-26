local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')
-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")
-- This sets up a keymap for copying the relative file path and line number
keymap.set("n", "<leader>wc", function()
  local project_root = vim.fn.getcwd()
  local filepath = vim.fn.expand("%:p")
  local relative_path = filepath:sub(#project_root + 2)
  local linenum = vim.fn.line(".")
  local result = relative_path .. ":" .. linenum
  vim.fn.setreg("+", result)
  print("Copied: " .. result)
end, { noremap = true, silent = true, desc = "Copy relative path to line" })

-- move selected lines
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- open Ex
keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
keymap.set("n", "tw", ":tabclose<Return>", opts)
-- Resize window
keymap.set("n", "<C-S-h>", "<C-w><")
keymap.set("n", "<C-S-l>", "<C-w>>")
keymap.set("n", "<C-S-k>", "<C-w>+")
keymap.set("n", "<C-S-j>", "<C-w>-")
