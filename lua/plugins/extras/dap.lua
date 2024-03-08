return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        config = {
          layouts = {
            {
              elements = {
                { id = "scopes", size = 0.4 },
                { id = "stacks", size = 0.4 },
                { id = "breakpoints", size = 0.2 },
              },
              size = 0.2, -- 40 columns
              position = "left",
            },
            {
              elements = {
                { id = "console", size = 0.75 },
                { id = "watches", size = 0.25 },
              },
              size = 0.2,
              position = "right",
            },
            {
              elements = { "repl" },
              size = 0.25, -- 25% of total lines
              position = "bottom",
            },
          },
        },
      },
    },

    keys = {
      {
        "<leader>dB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Breakpoint Condition",
      },
      {
        "<leader>db",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>da",
        function()
          require("dap").continue({ before = get_args })
        end,
        desc = "Run with Args",
      },
      {
        "<leader>dC",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
      },
      {
        "<leader>dg",
        function()
          require("dap").goto_()
        end,
        desc = "Go to line (no execute)",
      },
      {
        "<leader>dj",
        function()
          require("dap").down()
        end,
        desc = "Down",
      },
      {
        "<leader>dk",
        function()
          require("dap").up()
        end,
        desc = "Up",
      },
      {
        "<leader>dl",
        function()
          require("dap").run_last()
        end,
        desc = "Run Last",
      },
      {
        "<F8>",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<F9>",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<F10>",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>dp",
        function()
          require("dap").pause()
        end,
        desc = "Pause",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },
      {
        "<leader>ds",
        function()
          require("dap").session()
        end,
        desc = "Session",
      },
      {
        "<leader>dt",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
      {
        "<leader>dw",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "Widgets",
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      local values = {
        "dapui_stacks",
        "dapui_breakpoints",
        "dapui_scopes",
        "dapui_console",
        "dapui_watches",
        "dap-repl",
      }
      for _, value in ipairs(values) do
        table.insert(opts.options.ignore_focus, value)
      end
    end,
  },
}
