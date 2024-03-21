local telescope = require("telescope.builtin")

return {
  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      keys[#keys + 1] = {
        "gd",
        function()
          telescope.lsp_definitions({ reuse_win = true, initial_mode = "normal" })
        end,
        desc = "Goto Definition",
        has = "definition",
      }

      keys[#keys + 1] = {
        "gr",
        function()
          telescope.lsp_references({ initial_mode = "normal" })
        end,
        desc = "References",
      }

      keys[#keys + 1] = {
        "gI",
        function()
          telescope.lsp_implementations({ reuse_win = true, initial_mode = "normal" })
        end,
        desc = "Goto Implementation",
      }
    end,
  },
}
