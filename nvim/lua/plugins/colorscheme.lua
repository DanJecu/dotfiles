return {
  {
    'edeneast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd 'colorscheme nordfox'
    end,
  },
}
