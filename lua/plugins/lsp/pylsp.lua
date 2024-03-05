return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                pycodestyle = {
                  count = false,
                  ignore = { "W391" },
                  maxLineLength = 100,
                },
                pyflakes = {
                  enabled = false,
                }
              },
            },
          },
        },
      },
    },
  },
}
