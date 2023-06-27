return {
  -- disable some stuff
  { "better-escape.nvim", enabled = false },
  { "nvim-autopairs", enabled = false },
  { "mason.nvim", opts = { PATH = "append" } }, -- Mason binaries will have the lowest priority
  { "theHamsta/nvim-dap-virtual-text", opts = {} },
  { "which-key.nvim", opts = { window = { winblend = 10 } } },
  {
    "smart-splits.nvim",
    opts = function(_, opts) opts.at_edge = require("smart-splits.types").AtEdgeBehavior.stop end,
  },
  {
    "astrotheme",
    opts = { highlights = { global = { modify_hl_groups = function(hl) hl.Comment.italic = true end } } },
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      filetypes = {
        "*",
        cmp_docs = { always_update = true },
        cmp_menu = { always_update = true },
      },
      user_default_options = {
        mode = "virtualtext",
        tailwind = true,
      },
    },
  },
  {
    "nvim-notify",
    opts = {
      stages = "slide",
      timeout = 3000,
      max_height = function() return math.floor(vim.o.lines * 0.75) end,
      max_width = function() return math.floor(vim.o.columns * 0.75) end,
    },
  },
  {
    "toggleterm.nvim",
    keys = {
      { "<C-BS>", mode = { "t" }, "<C-\\><C-n>", desc = "Terminal normal mode" },
      { "<esc><esc>", mode = { "t" }, "<C-\\><C-n>:q<cr>", desc = "Terminal quit" },
    },
    opts = { terminal_mappings = false },
  },
  {
    "lspkind.nvim",
    opts = function(_, opts)
      -- use codicons preset
      opts.preset = "codicons"
      -- set some missing symbol types
      opts.symbol_map = {
        Array = "",
        Boolean = "",
        Key = "",
        Namespace = "",
        Null = "",
        Number = "",
        Object = "",
        Package = "",
        String = "",
      }
      return opts
    end,
  },
  {
    "heirline.nvim",
    opts = function(_, opts)
      local status = require "astronvim.utils.status"
      opts.statusline[9] = status.component.lsp { lsp_progress = false }
      opts.statusline = {
        -- statusline
        hl = { fg = "fg", bg = "bg" },
        status.component.mode(),
        status.component.git_branch(),
        status.component.diagnostics { padding = { left = 0 } },
        status.component.file_info { -- add file_info to breadcrumbs
          file_icon = { padding = { left = 0 } },
          filename = false,
          padding = { left = 0 },
        },
        status.component.separated_path {
          padding = { left = 0 },
          path_func = status.provider.filename { modify = ":.:h" },
        },
        status.component.file_info { -- add file_info to breadcrumbs
          file_icon = false,
          file_modified = false,
          padding = { left = 0 },
        },
        status.component.breadcrumbs {
          icon = { hl = true },
          prefix = false,
          padding = { left = 0 },
        },
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.git_diff {
          padding = { right = 0 },
        },
        status.component.nav { padding = { left = 0, right = 0 }, percentage = false, scrollbar = false },
        {
          provider = function() return "  " .. os.date "%R" end,
        },
        status.component.mode { padding = { left = 0, right = 0 }, surround = { separator = "right" } },
      }
      opts.tabline[2] = status.heirline.make_buflist(status.component.tabline_file_info { close_button = false })
      opts.winbar = nil
    end,
  },
  {
    "nvim-treesitter",
    dependencies = {

      { "nvim-treesitter/nvim-treesitter-context", config = true },
    },
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<nop>",
          node_decremental = "<bs>",
        },
      },
      auto_install = vim.fn.executable "tree-sitter" == 1,
      highlight = { disable = { "help", "latex" } },
      indent = { enable = true },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    enabled = true,
    event = "InsertEnter",
    dependencies = {
      -- snippets
      {
        "L3MON4D3/LuaSnip",
        dependencies = {
          "rafamadriz/friendly-snippets",
          config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
        },
        opts = {
          history = true,
          delete_check_events = "TextChanged",
        },
      },
      -- "hrsh7th/cmp-calc",
      -- "hrsh7th/cmp-emoji",
      -- "jc-doyle/cmp-pandoc-references",
      -- "kdheepak/cmp-latex-symbols",
    },
    opts = function(_, opts)
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      local function next_item()
        if cmp.visible() then
          cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }
        else
          cmp.complete()
        end
      end
      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end

      return require("astronvim.utils").extend_tbl(opts, {
        sources = cmp.config.sources {
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip", priority = 750 },
          { name = "pandoc_references", priority = 725 },
          { name = "emoji", priority = 700 },
          { name = "calc", priority = 650 },
          { name = "path", priority = 500 },
          { name = "buffer", priority = 250 },
        },
        mapping = {
          ["<C-n>"] = next_item,
          ["<C-j>"] = next_item,
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
      })
    end,
  },
}
