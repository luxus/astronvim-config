if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed =
          require("astrocore").list_insert_unique(opts.ensure_installed, { "markdown", "markdown_inline" })
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "markdown_oxide",
        -- add more arguments for adding more language servers
      })
    end,
  },
  {
    "AstroNvim/astrolsp",
    opts = {
      config = {
        markdown_oxide = { capabilities = { workspace = { didChangeWatchedFiles = { dynamicRegistration = true } } } },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      for _, source in ipairs(opts.sources or {}) do
        if source.name == "nvim_lsp" then
          source.option = require("astrocore").extend_tbl(
            source.option,
            { markdown_oxide = { keyword_pattern = [[\(\k\| \|\/\|#\)\+]] } }
          )
          break
        end
      end
    end,
  },
}
