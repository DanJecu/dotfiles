return {
  -- Comment with "gc" for block and "gcc" for a line
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },
  -- Autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require('nvim-autopairs').setup {}
      -- If you want to automatically add `(` after selecting a function or method
      local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
      local cmp = require 'cmp'
      cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
  },
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
  -- Git Blame plugin configuration
  {
    'f-person/git-blame.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      vim.g.gitblame_display_virtual_text = 0
      vim.g.gitblame_message_template = '<author> • <date>'
      vim.g.gitblame_date_format = '%r' -- relative time format
    end,
  },
  -- Lualine Configuration
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local git_blame = require 'gitblame'
      require('lualine').setup {
        options = {
          globalstatus = true,
        },
        sections = {
          lualine_x = {
            { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
          },
        },
      }
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      vim.opt.termguicolors = true
      require('bufferline').setup {}
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
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
    config = function()
      -- Override LazyGit settings
      vim.g.lazygit_config = {
        -- Custom edit commands to use Neovim's remote capabilities
        edit = "nvim --server $NVIM --remote-send '<cmd>close<cr><cmd>lua EditFromLazygit([[{{filename}}]])<CR>'",
        editAtLine = "nvim --server $NVIM --remote-send '<cmd>close<CR><cmd>lua EditLineFromLazygit([[{{filename}}]],{{line}})<CR>'",
      }

      -- Define the Lua functions for handling the edits
      vim.api.nvim_create_autocmd('User', {
        pattern = 'LazyVimStarted',
        callback = function()
          -- Function to edit a file at a specific line
          _G.EditLineFromLazygit = function(file_path, line)
            local current_path = vim.fn.expand '%:p'
            if current_path == file_path then
              vim.cmd(tostring(line))
            else
              vim.cmd('e ' .. file_path)
              vim.cmd(tostring(line))
            end
          end

          -- Function to edit a file without a specific line
          _G.EditFromLazygit = function(file_path)
            local current_path = vim.fn.expand '%:p'
            if current_path ~= file_path then
              vim.cmd('e ' .. file_path)
            end
          end
        end,
      })
    end,
  },
}
