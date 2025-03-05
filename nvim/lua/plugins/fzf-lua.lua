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
        desc = 'Find Files',
      },
      {
        '<leader><leader>',
        function()
          require('fzf-lua').buffers()
        end,
<<<<<<< HEAD
        desc = '[F]ind Buffers',
      },
      {
        '<leader>fw',
        function()
          require('fzf-lua').grep_cWORD()
        end,
        desc = '[F]ind [W]ord',
      },
      {
        '<leader>fg',
        function()
          require('fzf-lua').git_status()
        end,
        desc = '[F]ind [G]it Files',
      },
      {
        '<leader>gh',
        function()
          require('fzf-lua').git_stash()
        end,
        desc = '[G]it Stas[h]',
||||||| 6be1109
        desc = 'Find Buffers (fzf-lua)',
=======
        desc = '[F]ind Buffers (fzf-lua)',
      },
      {
        '<leader>fg',
        function()
          require('fzf-lua').git_status()
        end,
        desc = '[F]ind [G]it Files',
      },
      {
        '<leader>fw',
        function()
          require('fzf-lua').grep_cWORD()
        end,
        desc = '[F]ind [W]ord',
>>>>>>> 597126a5462b7ec19ff1abf72483cafe3cd629c5
      },
    },
  },
}
