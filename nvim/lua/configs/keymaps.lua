-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Window management
vim.api.nvim_set_keymap('n', '<leader>v', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s', ':split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wd', ':close<CR>', { noremap = true, silent = true })

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Buffers navigation & management
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
vim.keymap.set('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { desc = 'Delete Buffer' })
vim.keymap.set('n', '<leader>bD', '<cmd>:bd<cr>', { desc = 'Delete Buffer and Window' })

-- Move selected lines
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Open explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open Explorer' })

-- Select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Don't copy deleted text
vim.keymap.set('n', 'd', '"_d')
vim.keymap.set('v', 'd', '"_d')

-- Keep `dd` copying deleted lines
vim.keymap.set('n', 'dd', 'dd', { noremap = true, silent = true })

-- Don't copy when pasting over selection
vim.keymap.set('v', 'p', '"_dP')

-- Copy relative path and line numeber on cursor
vim.keymap.set('n', '<leader>cp', function()
  local file = vim.fn.expand '%' -- Get relative file path
  local line = vim.fn.line '.' -- Get current line number
  local result = file .. ':' .. line
  vim.fn.setreg('+', result) -- Copy to system clipboard
  print('Copied: ' .. result)
end, { desc = 'Copy relative file path with line number' })

vim.keymap.set('n', '<leader>gc', ':GitBlameOpenCommitURL<CR>', { desc = '[G]it Open [C]ommit URL' })
