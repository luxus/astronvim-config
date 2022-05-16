local sign_define = vim.fn.sign_define
return function()
  local dap = require "dap"
  dap.adapters.python = {
    type = "executable",
    command = "/usr/bin/python",
    args = { "-m", "debugpy.adapter" },
  }
  dap.configurations.python = {
    {
      type = "python",
      request = "launch",
      name = "Launch file",
    },
  }
  sign_define("DapStopped", { text = "", texthl = "DiagnosticWarn" })
  sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticInfo" })
  sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError" })
  sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticInfo" })
  sign_define("DapLogPoint", { text = ".>", texthl = "DiagnosticInfo" })
end
