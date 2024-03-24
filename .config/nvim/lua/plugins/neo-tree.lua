return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
    require('neo-tree').setup({
    default_component_configs = {
      filesystem = {
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
          --               -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
      },
    },
    })
    vim.keymap.set('n', '<leader>e', ':Neotree toggle filesystem reveal left<CR>', {})
    vim.keymap.set('n', '<leader>E', ':Neotree toggle git_status reveal left<CR>', {})
    end
}
