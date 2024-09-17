vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopeResults",
  callback = function(ctx)
    vim.api.nvim_buf_call(ctx.buf, function()
      vim.fn.matchadd("TelescopeParent", "\t\t.*$")
      vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
    end)
  end,
})

local function filenameFirst(_, path)
  local tail = vim.fs.basename(path)
  local parent = vim.fs.dirname(path)
  if parent == "." then
    return tail
  end
  return string.format("%s\t\t%s", tail, parent)
end

return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {

    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },

        pickers = {
          find_files = {
            path_display = filenameFirst,
            previewer = false,
          },
          git_files = {
            path_display = filenameFirst,
            previewer = false,
          },
        },
      })

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            -- '.git',
            -- '.DS_Store',
            -- 'thumbs.db',
          },
          never_show = {},
        },
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
    config = function()
      vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = "#40a02b" })
      vim.api.nvim_set_hl(0, "NotifyINFOIcon", { fg = "#40a02b" })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping["<M-Space>"] = cmp.mapping.complete()
    end,
  },
}
