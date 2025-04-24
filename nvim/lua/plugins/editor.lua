return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "http", "graphql" },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local git_blame = require("gitblame")
      require("lualine").setup({
        options = {
          globalstatus = true,
        },
        sections = {
          lualine_c = {
            {
              "filename",
              path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
            },
          },
          lualine_x = {
            { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
          },
        },
      })
    end,
  },
  {
    "f-person/git-blame.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.g.gitblame_display_virtual_text = 0
      vim.g.gitblame_message_template = "<author> • <date>"
      vim.g.gitblame_date_format = "%r" -- relative time format
    end,
  },
}
