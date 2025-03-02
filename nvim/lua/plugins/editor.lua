return {
  -- Colorscheme
  {
    'edeneast/nightfox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd 'colorscheme nordfox'
    end,
  },
  -- Fzf
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional
    opts = {
      winopts = {
        height = 0.85, -- adjust window height
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
  -- Comment with "gc" for block and "gcc" for a line
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
}
