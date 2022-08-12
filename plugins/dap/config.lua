local dap = require "dap"
dap.adapters.python = { type = "executable", command = "debugpy-adapter" }
dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
  },
}
vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticWarn" })
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticInfo" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DiagnosticError" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticInfo" })
vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "DiagnosticInfo" })
