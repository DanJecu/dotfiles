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
