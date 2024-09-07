local keymap = vim.keymap

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")
-- This sets up a keymap for copying the relative file path and line number
vim.keymap.set("n", "<leader>wc", function()
  local project_root = vim.fn.getcwd()
  local filepath = vim.fn.expand("%:p")
  local relative_path = filepath:sub(#project_root + 2)
  local linenum = vim.fn.line(".")
  local result = relative_path .. ":" .. linenum
  vim.fn.setreg("+", result)
  print("Copied: " .. result)
end, { noremap = true, silent = true, desc = "Copy relative path to line" })

-- move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- open Ex
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
