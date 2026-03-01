return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "frappe",
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local git_blame = require("gitblame")

      opts.sections.lualine_a = {
        {
          "mode",
          fmt = function(str)
            return str:sub(1, 1)
          end,
        },
      }
      opts.sections.lualine_b = {}

      table.insert(opts.sections.lualine_x, {
        git_blame.get_current_blame_text,
        cond = git_blame.is_blame_text_available,
      })
    end,
  },

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
          ]],
        },
      },
    },
  },
}
