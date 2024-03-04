return {
  {
    "stevearc/aerial.nvim",
    -- event = "User AstroFile",
    event = "VeryLazy",
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
}
