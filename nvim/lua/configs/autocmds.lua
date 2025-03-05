-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

if vim.fn.executable 'nvr' == 1 then
  vim.env.GIT_EDITOR = "nvr --remote-tab-wait +'set bufhidden=delete'"
end
