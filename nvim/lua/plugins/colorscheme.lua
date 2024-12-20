return {
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup {
        style = "dark", -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
      }
      require("onedark").load()
    end,
  },
}
