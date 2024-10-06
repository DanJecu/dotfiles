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
        preview = { hide_on_startup = true },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
        defaults = {
          file_ignore_patterns = { "node_modules" },
          path_display = filenameFirst,
          mappings = {
            n = {
              ["o"] = require("telescope.actions.layout").toggle_preview,
            },
          },
        },
        pickers = {
          live_grep = {
            preview = { hide_on_startup = false },
          },
        },
      })

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") }, { desc = "Grep string" })
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
}
