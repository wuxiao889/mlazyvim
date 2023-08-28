return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", false },
      { "<leader>E", false },
      { "<space>e", "<leader>fe<c-w>=", desc = "Explorer NeoTree (root dir)", remap = true },
      { "<space>E", "<leader>fE<c-w>=", desc = "Explorer NeoTree (cwd)", remap = true },
    },
    opts = {
      filesystem = {
        commands = {
          copy_name = function(state)
            local node = state.tree:get_node()
            print(node.name)
            vim.fn.setreg("", node.name)
          end,
          copy_path = function(state)
            local node = state.tree:get_node()
            print(node.path)
            vim.fn.setreg("", node.path)
          end,
        },
        window = {
          mappings = {
            ["u"] = "navigate_up",
            ["y"] = "copy_name",
            ["Y"] = "copy_path",
          },
        },
      },
      default_component_configs = {
        symbols = {
          -- Change type
          added = "✚",
          deleted = "✖",
          modified = "m",
          renamed = "󰁕",
          -- Status type
          untracked = "?",
          ignored = "",
          unstaged = "×",
          staged = "√",
          conflict = "",
        },
      },
    },
  },
}
