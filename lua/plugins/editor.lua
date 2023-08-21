return {
  {
    -- like NerdTree
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<Space>e", "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
      { "<Space>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
    },
    opts = {
      window = {
        mappings = {
          ["u"] = "navigate_up",
        },
      },
      -- filesystem = {
      --   filtered_items = {
      --     hide_gitignored = false,
      --   },
      -- },
    },
  },

  {
    "simrat39/symbols-outline.nvim",
    lazy = true,
    keys = {
      { "<Space>t", ":SymbolsOutline<Cr>", desc = "toggle symbols outline" },
    },
  },

  { "folke/which-key.nvim", enabled = false },

  { "folke/noice.nvim", enabled = false },
}
