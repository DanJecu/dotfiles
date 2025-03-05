return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      winopts = {
        height = 0.85,
        width = 0.80,
      },
      files = {
        cmd = 'fd --type f --exclude node_modules --exclude .nx',
        formatter = 'path.filename_first',
        cwd_prompt = false,
      },
      keymap = {
        fzf = {
          ['ctrl-l'] = 'select-all+accept',
        },
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
      {
        '<leader>fg',
        function()
          require('fzf-lua').git_status()
        end,
        desc = '[F]ind [G]it Files',
      },
    },
  },
}
