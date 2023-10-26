return {
  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      keys[#keys + 1] = {
        "gd",
        function()
          require("telescope.builtin").lsp_definitions({ reuse_win = true, initial_mode = "normal" })
        end,
        desc = "Goto Definition",
        has = "definition",
      }

      keys[#keys + 1] = {
        "gr",
        function()
          require("telescope.builtin").lsp_references({ initial_mode = "normal" })
        end,
        desc = "References",
      }

      keys[#keys + 1] = {
        "gI",
        function()
          require("telescope.builtin").lsp_implementations({ reuse_win = true, initial_mode = "normal" })
        end,
        desc = "Goto Implementation",
      }
    end,
  },
}
