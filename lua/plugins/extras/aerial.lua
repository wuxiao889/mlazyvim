local Util = require("lazyvim.util")

return {
  {
    "stevearc/aerial.nvim",
    -- event = "User AstroFile",
    event = "LazyFile",
    keys = {
      {
        "<space>t",
        function()
          require("aerial").toggle()
        end,
        desc = "toggle outline",
      },
    },
    opts = {
      attach_mode = "global",
      backends = {
        ["_"] = { "lsp", "treesitter" },
        --  lsp work not well with cpp
        cpp = { "treesitter" },
      },
      layout = { min_width = 28 },
      show_guides = true,
      guides = {
        mid_item = "├ ",
        last_item = "└ ",
        nested_top = "│ ",
        whitespace = "  ",
      },
      keymaps = {
        ["[y"] = "actions.prev",
        ["]y"] = "actions.next",
        ["[Y"] = "actions.prev_up",
        ["]Y"] = "actions.next_up",
        ["{"] = false,
        ["}"] = false,
        ["[["] = false,
        ["]]"] = false,
      },
      filter_kind = {
        "Array",
        "Boolean",
        "Class",
        "Constant",
        "Constructor",
        "Enum",
        "EnumMember",
        "Event",
        "Field",
        "File",
        "Function",
        "Interface",
        "Key",
        "Method",
        "Module",
        "Namespace",
        "Null",
        "Number",
        "Object",
        "Operator",
        "Package",
        "Property",
        "String",
        "Struct",
        "TypeParameter",
      },
    },
  },

  -- Telescope integration
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = function()
      Util.on_load("telescope.nvim", function()
        require("telescope").load_extension("aerial")
      end)
    end,
    keys = {
      {
        "<leader>ss",
        "<cmd>Telescope aerial<cr>",
        desc = "Goto Symbol (Aerial)",
      },
    },
  },

  -- lualine integration
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      table.insert(opts.options.disabled_filetypes, "aerial")
      table.insert(opts.sections.lualine_c, {
        "aerial",
        sep = " ", -- separator between symbols
        sep_icon = "", -- separator between icon and symbol

        -- The number of symbols to render top-down. In order to render only 'N' last
        -- symbols, negative numbers may be supplied. For instance, 'depth = -1' can
        -- be used in order to render only current symbol.
        depth = 5,

        -- When 'dense' mode is on, icons are not rendered near their symbols. Only
        -- a single icon that represents the kind of current symbol is rendered at
        -- the beginning of status line.
        dense = false,

        -- The separator to be used to separate symbols in dense mode.
        dense_sep = ".",

        -- Color the symbol icons.
        colored = true,
      })
    end,
  },
}
