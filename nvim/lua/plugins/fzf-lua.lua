return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")

    fzf.setup({
      winopts = {
        preview = {
        },
      },
    })

    -- Key mappings for fzf-lua commands
    vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find Files (fzf-lua)" })
    vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "Live Grep (fzf-lua)" })
    vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "Buffers (fzf-lua)" })
    vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "Help Tags (fzf-lua)" })
  end,
}
