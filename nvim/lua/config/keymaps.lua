-- Copy relative path and line numeber on cursor
vim.keymap.set("n", "<leader>cp", function()
  local file = vim.fn.expand("%") -- Get relative file path
  local line = vim.fn.line(".") -- Get current line number
  local result = file .. ":" .. line
  vim.fn.setreg("+", result) -- Copy to system clipboard
  print("Copied: " .. result)
end, { desc = "Copy relative file path with line number" })

-- Open definition in vertical split
vim.keymap.set(
  "n",
  "gv",
  "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>",
  { desc = "Go to definition in vertical split" }
)
