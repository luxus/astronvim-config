return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "nix" })
      end
    end,
  },
  {
    "AstroNvim/astrolsp",
    -- we must use the function override because table merging
    -- does not play nicely with list-like tables
    ---@param opts AstroLSPOpts
    opts = function(plugin, opts)
      -- safely extend the servers list
      opts.servers = opts.servers or {}
      vim.list_extend(opts.servers, {
        "nixd",
        -- add more servers as needed...
      })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require "null-ls"
      if type(opts.sources) == "table" then
        vim.list_extend(opts.sources, {
          nls.builtins.code_actions.statix,
          nls.builtins.formatting.nixfmt,
          nls.builtins.diagnostics.deadnix,
        })
      end
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        nix = { "nixfmt" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      local function get_file_name() return vim.api.nvim_buf_get_name(0) end

      require("lint").linters.deadnix = {
        name = "deadnix",
        cmd = "deadnix",
        stdin = true,
        args = { "-o", "json", get_file_name },
        ignore_exitcode = true,
        parser = function(output, bufnr)
          if output == "" then return {} end
          local decoded = vim.json.decode(output)
          if decoded == nil then return {} end
          local diagnostics = {}
          local current_file = vim.api.nvim_buf_get_name(bufnr)

          if current_file == decoded.file then
            for _, item in ipairs(decoded.results) do
              table.insert(diagnostics, {
                lnum = item.line - 1,
                end_lnum = item.line - 1,
                col = item.column - 1,
                end_col = item.endColumn,
                severity = vim.diagnostic.severity.WARN,
                source = "deadnix",
                message = item.message,
              })
            end
          end

          return diagnostics
        end,
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function() require("lint").try_lint() end,
      })

      vim.api.nvim_create_autocmd({ "BufReadPost" }, {
        callback = function() require("lint").try_lint() end,
      })
    end,
  },
  opts = {
    linters_by_ft = {
      nix = { "deadnix" },
    },
  },
}
