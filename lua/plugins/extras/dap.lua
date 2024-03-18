return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")
      dap.configurations.cpp = {
        {
          name = "panda",
          type = "cppdbg",
          request = "launch",
          program = "/home/wxx/panda/pandaPIengine/build/pandaPIengine",
          cwd = "${workspaceFolder}",
          args = { "/home/wxx/panda/run/problem--domain.pddl--problem.pddl.sas" },
          setupCommands = {
            {
              description = "为 gdb 启用整齐打印",
              text = "-enable-pretty-printing",
              ignoreFailures = true,
            },
          },
        },
      }
    end,
  },
}
