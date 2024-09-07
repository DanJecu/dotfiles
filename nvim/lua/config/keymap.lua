vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- clear highlights
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')


-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>' )
vim.keymap.set('n', '<C-l>', '<C-w><C-l>' )
vim.keymap.set('n', '<C-j>', '<C-w><C-j>' )
vim.keymap.set('n', '<C-k>', '<C-w><C-k>' )

vim.api.nvim_set_keymap('n', '<leader>|', ':vsplit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>-', ':split<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wd', ':close<CR>', { noremap = true, silent = true })

-- buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>")
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>" )
vim.keymap.set("n", "<leader>bd", ":bd<CR>" )
vim.keymap.set("n", "<leader>bD", "<cmd>:bd<cr>")

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
