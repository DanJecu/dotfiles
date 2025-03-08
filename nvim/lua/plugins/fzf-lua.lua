return {
  {
    'ibhagwan/fzf-lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      winopts = {
        preview = { layout = 'vertical' },
      },
      files = {
        cmd = 'fd --type f --hidden --exclude node_modules --exclude .nx',
        formatter = 'path.filename_first',
        cwd_prompt = false,
        hidden = true,
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
        '<leader>fq',
        function()
          require('fzf-lua').grep_quickfix()
        end,
        desc = '[F]ind [Q]uickfix',
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
        desc = '[F]ind Buffers',
      },
      {
        '<leader>gh',
        function()
          require('fzf-lua').git_stash()
        end,
        desc = '[G]it Stas[h]',
      },
      {
        '<leader>fm',
        function()
          require('fzf-lua').marks()
        end,
        desc = '[F]ind [M]arks',
      },
      {
        '<leader>fw',
        function()
          require('fzf-lua').grep_cWORD()
        end,
        desc = '[F]ind [W]ord',
      },
    },
  },
}
