return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      files = {
        cmd = "fd --type f --exclude node_modules --exclude .nx",
      },
    },
  },
}
