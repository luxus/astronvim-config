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

      program = "${file}",
      pythonPath = function()
        return "python"
      end,
    },
  }
  dap.listeners.after.event_initialized["dapui"] = function(_, _)
    vim.notify(
      string.format("%s", dap.session().config.program),
      "debug",
      { title = "Debugger Started", timeout = 500 }
    )
  end
  dap.listeners.before.event_terminated["dapui"] = function(_, _)
    vim.notify(
      string.format("%s", dap.session().config.program),
      "debug",
      { title = "Debugger Terminated", timeout = 500 }
    )
  end

  vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticWarn" })
  vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticInfo" })
  vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError" })
  vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticInfo" })
  vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "DiagnosticInfo" })
end
