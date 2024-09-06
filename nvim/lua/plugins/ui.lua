return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
██████╗  ██████╗      ██████╗  ██████╗  ██████╗ ██████╗ 
██╔══██╗██╔═══██╗    ██╔════╝ ██╔═══██╗██╔═══██╗██╔══██╗
██║  ██║██║   ██║    ██║  ███╗██║   ██║██║   ██║██║  ██║
██║  ██║██║   ██║    ██║   ██║██║   ██║██║   ██║██║  ██║
██████╔╝╚██████╔╝    ╚██████╔╝╚██████╔╝╚██████╔╝██████╔╝
╚═════╝  ╚═════╝      ╚═════╝  ╚═════╝  ╚═════╝ ╚═════╝ 
                                                        
      ]]

      opts.theme = "doom"
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
}
