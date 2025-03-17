-- Copy relative path and line numeber on cursor
vim.keymap.set("n", "<leader>cp", function()
  local file = vim.fn.expand("%") -- Get relative file path
  local line = vim.fn.line(".") -- Get current line number
  local result = file .. ":" .. line
  vim.fn.setreg("+", result) -- Copy to system clipboard
  print("Copied: " .. result)
end, { desc = "Copy relative file path with line number" })

-- Open explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open Explorer" })

-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Window management
vim.api.nvim_set_keymap("n", "<leader>v", ":vsplit<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>s", ":split<CR>", { noremap = true, silent = true })
