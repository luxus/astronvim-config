local dap, mason_dap, registry = require "dap", require "mason-nvim-dap", require "mason-registry"

mason_dap.setup {
  automatic_installation = true,
  ensure_installed = { "bash", "js", "python" },
}

mason_dap.setup_handlers {
  python = function()
    dap.adapters.python = { type = "executable", command = "debugpy-adapter" }
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
      },
    }
  end,
  bash = function()
    local BASHDB_DIR = registry.get_package("bash-debug-adapter"):get_install_path() .. "/extension/bashdb_dir"
    dap.adapters.sh = { type = "executable", command = "bash-debug-adapter" }
    dap.configurations.sh = {
      {
        type = "sh",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${fileDirname}",
        pathBashdb = BASHDB_DIR .. "/bashdb",
        pathBashdbLib = BASHDB_DIR,
        pathBash = "bash",
        pathCat = "cat",
        pathMkfifo = "mkfifo",
        pathPkill = "pkill",
        env = {},
        args = {},
      },
    }
  end,
}
