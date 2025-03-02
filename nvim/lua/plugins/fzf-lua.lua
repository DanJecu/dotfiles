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
        '<C-l>', -- Keybinding for adding all files to quickfix
        function()
          local actions = require 'fzf-lua.actions' -- Ensure actions are required
          local fzf = require 'fzf-lua'
          fzf.files {
            actions = {
              ['<C-l>'] = { fn = actions.file_sel_to_qf, prefix = 'select-all' },
            },
          }
        end,
        desc = 'Add All Files to Quickfix (fzf-lua)',
      },
    },
  },
}
