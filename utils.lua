M = {}

function M.quick_notification(msg) vim.notify(msg, "info", { title = "AstroNvim", timeout = 0 }) end

function M.vim_opt_toggle(opt, on, off, name)
  local is_off = vim.opt[opt]:get() == off
  vim.opt[opt] = is_off and on or off
  M.quick_notification(name .. " " .. (is_off and "Enabled" or "Disabled"))
end

function M.async_run(cmd, on_finish)
  local lines = { "" }

  local function on_event(_, data, event)
    if (event == "stdout" or event == "stderr") and data then vim.list_extend(lines, data) end

    if event == "exit" then
      vim.fn.setqflist({}, " ", {
        title = table.concat(cmd, " "),
        lines = lines,
        efm = "%f:%l:%c: %t%n %m",
      })
      if on_finish then on_finish() end
    end
  end

  vim.fn.jobstart(cmd, {
    on_stdout = on_event,
    on_stderr = on_event,
    on_exit = on_event,
    stdout_buffered = true,
    stderr_buffered = true,
  })
end

function M.toggle_qf()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
      break
    end
  end
  if qf_exists then
    vim.cmd.cclose()
  elseif not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd.copen()
  end
end

-- --- Install all Mason packages from mason-lspconfig, mason-null-ls, mason-nvim-dap
-- function M.mason.install_all()
--   local registry_avail, registry = pcall(require, "mason-registry")
--   if not registry_avail then
--     vim.api.nvim_err_writeln "Unable to access mason registry"
--     return
--   end
--
--   local installed = false
--   for plugin_name, opts in pairs {
--     ["mason-lspconfig"] = { type = "server", map = "lspconfig" },
--     ["mason-null-ls"] = { type = "source", map = "null_ls" },
--     ["mason-nvim-dap"] = { type = "source", map = "nvim_dap" },
--   } do
--     local plugin_avail, plugin = pcall(require, plugin_name .. ".settings")
--     if plugin_avail then
--       local mappings = require(plugin_name .. ".mappings." .. opts.type)[opts.map .. "_to_package"]
--       local pkgs = plugin.current.ensure_installed
--       for _, pkg in ipairs(pkgs) do
--         local mason_pkg = mappings[pkg]
--         if not registry.is_installed(mason_pkg) then
--           installed = true
--           astronvim.mason.update(mason_pkg)
--         end
--       end
--     end
--   end
--   if not installed then astronvim.notify "Mason: No packages to install" end
-- end

return M
