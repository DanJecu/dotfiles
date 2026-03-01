return {
  {
    "f-person/git-blame.nvim",
    init = function()
      vim.g.gitblame_display_virtual_text = 0
      vim.g.gitblame_message_template = "<author> • <date>"
      vim.g.gitblame_date_format = "%r"
    end,
  },
  {
    "nvim-mini/mini.files",
    priority = 1000,
    config = function()
      local MiniFiles = require("mini.files")
      MiniFiles.setup({
        options = { use_as_default_explorer = true },
      })

      vim.keymap.set("n", "<leader>pe", function()
        MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
        MiniFiles.reveal_cwd()
      end, { desc = "Open MiniFiles at current file's directory" })

      vim.keymap.set("n", "<leader>pE", function()
        require("mini.files").open()
      end, { desc = "Open MiniFiles" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = {
      max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
      trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
      zindex = 20, -- The Z-index of the context window
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        formatters = {
          file = {
            filename_first = true,
          },
        },
        sources = {
          files = {
            hidden = true,
            ignored = true,
            exclude = { "node_modules", ".nx-cache", "build", "dist" },
          },
        },
      },
    },
  },
}
