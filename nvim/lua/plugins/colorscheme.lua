return  { 
    'loctvl842/monokai-pro.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require('monokai-pro').setup {
        styles = {
        },
      }
      vim.cmd.colorscheme 'monokai-pro'
    end,
  }
