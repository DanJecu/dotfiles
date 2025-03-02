return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      winopts = {
        height = 0.85,
        width = 0.80,
        preview = { layout = 'vertical' },
      },
      files = {
        cmd = 'fd --type f --exclude node_modules --exclude .nx',
      },
    },
    keymap = {
      builtin = {
        ['<C-d>'] = 'preview-page-down', -- Scroll down in preview
        ['<C-u>'] = 'preview-page-up', -- Scroll up in preview
        ['<C-f>'] = 'preview-half-page-down', -- Half-page down
        ['<C-b>'] = 'preview-half-page-up', -- Half-page up
      },
    },
    keys = {
      {
        '<leader>/',
        function()
          require('fzf-lua').live_grep()
        end,
        desc = 'Live Grep (fzf-lua)',
      },
      {
        '<C-p>',
        function()
          require('fzf-lua').files()
        end,
        desc = 'Find Files (fzf-lua)',
      },
      {
        '<leader><leader>',
        function()
          require('fzf-lua').buffers()
        end,
        desc = 'Find Buffers (fzf-lua)',
      },
    },
  },
}
