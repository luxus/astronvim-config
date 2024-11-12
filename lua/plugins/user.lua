---@type LazySpec
return {
  -- {
  --   "hrsh7th/nvim-cmp",
  --   optional = true,
  --   dependencies = {
  --     {
  --       "supermaven-inc/supermaven-nvim",
  --       opts = {
  --         disable_inline_completion = false, -- disables inline completion for use with cmp
  --         disable_keymaps = false,
  --       },
  --     },
  --   },
  --   opts = function(_, opts)
  --     opts.sources = opts.sources or {}
  --     table.insert(opts.sources, { name = "supermaven" })
  --   end,
  -- },

  { "render-markdown.nvim", opts = { file_types = { "markdown", "mdx" } } },
  {
    "max397574/better-escape.nvim",
    enabled = true,
    opts = {
      mappings = {
        i = { j = { k = false, j = false } }, -- disable insert mode escape
        t = {
          ["<Esc>"] = { ["<Esc>"] = "<C-\\><C-n>:q<CR>" }, -- add double escape to close
        },
      },
    },
  },
  {
    "oxfist/night-owl.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = {},
  },
  {
    "MysticalDevil/inlay-hints.nvim",
    event = "LspAttach",
    enabled = true,
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        typescript = {
          inlayHints = {
            parameterNames = { enabled = false },
            parameterTypes = { enabled = false },
            variableTypes = { enabled = false },
            propertyDeclarationTypes = { enabled = false },
            functionLikeReturnTypes = { enabled = false },
            enumMemberValues = { enabled = false },
          },
        },
      },
    },
  },
  {
    "indent-blankline.nvim",
    enabled = false,
    optional = true,
  },
  {
    "tokyonight.nvim",
    optional = true,
    opts = {
      style = "night", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
      dim_inactive = false,
      light_style = "day", -- The theme is used when the background is set to light
      transparent = true, -- Enable this to disable setting the background color
    },
  },
  {
    "shellRaining/hlchunk.nvim",
    event = { "User AstroFile" },
    config = function(_, opts)
      require("hlchunk").setup(require("astrocore").extend_tbl(opts, {
        chunk = {
          enable = true,
          notify = true,
          chars = {
            horizontal_line = "━",
            vertical_line = "┃",
            left_top = "┏",
            left_bottom = "┗",
            right_arrow = "➤",
          },
        },
        indent = {
          enable = true,
          style = {
            vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID "Whitespace"), "fg", "gui"),
            -- { fg = "#181818" },
          },
        },
        blank = {
          enable = true,
        },
        line_num = {
          enable = false,
        },
        exclude_filetypes = {
          AvanteInput = true,
        },
      }))
    end,
  },
  { "LuaSnip", enabled = false },
  { "neo-tree", enabled = false },
  {
    "nvim-highlight-colors",
    optional = true,
    opts = { enable_tailwind = true, enable_named_colors = true, virtual_symbol = "" },
  },
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    opts = function(_, opts)
      if not opts.formatting then opts.formatting = {} end
      local formatter = vim.tbl_get(opts, "formatting", "format")
      opts.formatting.format = function(entry, item)
        local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
        if formatter then item = formatter(entry, item) end
        if color_item.abbr_hl_group then
          item.kind, item.kind_hl_group = color_item.abbr, color_item.abbr_hl_group
        end
        return item
      end
    end,
  },
  {
    "modus-themes.nvim",
    optional = true,
    opts = {
      variant = "default", -- Theme comes in four variants `default`, `tinted`, `deuteranopia`, and `tritanopia`
      transparent = false,
      -- on_colors = function(colors)
      --   colors.error = colors.red_faint -- Change error color to the "faint" variant
      -- end,
      on_highlights = function(highlight, color)
        highlight.DiffAdd = { fg = color.green } -- Change Boolean highlight to use the green color
        highlight.FoldColumn = { fg = color.fg_dim } -- Change Boolean highlight to use the green color
        -- highlight.CursorColumn = { fg = color.fg_dim, bg = color.bg_main } -- Change Boolean highlight to use the green color
        -- highlight.ColorColumn = { fg = color.fg_dim, bg = color.bg_main } -- Change Boolean highlight to use the green color
        highlight.DiffChange = { fg = color.yellow } -- Change Boolean highlight to use the green color
        highlight.DiffDelete = { fg = color.red } -- Change Boolean highlight to use the green color
      end,
    },
  },
  {
    "nightfox.nvim",
    optional = true,
    dependencies = { "nvim-notify", optional = true, opts = { background_colour = "#000000" } },
    opts = {
      options = {
        transparent = true,
        dim_inactive = false,
        modules_default = true,
        -- modules = {
        --   indent_blankline = true,
        -- },
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic",
        },
        inverse = { -- Inverse highlight for different types
          match_paren = true,
        },
      },
    },
  },
  {
    "gitsigns.nvim",
    optional = true,
    opts = {
      current_line_blame = false,
      current_line_blame_opts = { ignore_whitespace = true },
      numhl = false,
      -- signcolumn = false,
    },
  },
  {
    "tris203/precognition.nvim",
    event = "User AstroFile",
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        mappings = { n = { ["<Leader>uP"] = { "<CMD>Precognition toggle<CR>", desc = "Toggle Precognition" } } },
      },
    },
    opts = {
      startVisible = false,
      showBlankVirtLine = true,
      -- hints = {
      --      Caret = { text = "^", prio = 2 },
      --      Dollar = { text = "$", prio = 1 },
      --      MatchingPair = { text = "%", prio = 5 },
      --      Zero = { text = "0", prio = 1 },
      --      w = { text = "w", prio = 10 },
      --      b = { text = "b", prio = 9 },
      --      e = { text = "e", prio = 8 },
      --      W = { text = "W", prio = 7 },
      --      B = { text = "B", prio = 6 },
      --      E = { text = "E", prio = 5 },
      -- },
      -- gutterHints = {
      --     -- prio is not currently used for gutter hints
      --     G = { text = "G", prio = 1 },
      --     gg = { text = "gg", prio = 1 },
      --     PrevParagraph = { text = "{", prio = 1 },
      --     NextParagraph = { text = "}", prio = 1 },
      -- },
    },
  },
  -- {
  --   "nvim-highlight-colors",
  --   ---Render style
  --   ---@usage 'background'|'foreground'|'virtual'
  --   opts = {
  --     render = "virtual",
  --
  --     ---Set virtual symbol (requires render to be set to 'virtual')
  --     virtual_symbol = "■",
  --   },
  -- },
  -- { "nvimdev/indentmini.nvim", event = "BufEnter", opts = {} },
  -- {
  --   "copilot.lua",
  --   optional = true,
  --   opts = {
  --     suggestion = {
  --       keymap = {
  --         accept = "<C-l>",
  --         accept_word = false,
  --         accept_line = false,
  --         next = "<C-.>",
  --         prev = "<C-,>",
  --         dismiss = "<C/>",
  --         --dismiss = false,
  --       },
  --     },
  --   },
  -- },
  {
    "astrotheme",
    opts = {
      style = { transparent = true },
      --     palettes = {
      --       global = { -- Globally accessible palettes, theme palettes take priority.
      --         my_grey = "#55555e",
      --         my_cyan = "#559ba3",
      --         my_green = "#7da77e",
      --         my_yellow = "#dbbc8a",
      --       },
      --       astrodark = {
      --         ui = {
      --           red = "#e67e80", -- Overrides astrodarks red UI color
      --           accent = "#CC83E3", -- Changes the accent color of astrodark.
      --           orange = "#EB8332",
      --           yellow = "#D09214",
      --           green = "#75AD47",
      --           cyan = "#00B298",
      --           blue = "#50A4E9",
      --           purple = "#CC83E3",
      --           tabline = "#111317",
      --           winbar = "#797D87",
      --           tool = "#16181D",
      --           base = "#171718",
      --           inactive_base = "#16181D",
      --           statusline = "#111317",
      --           split = "#111317",
      --           float = "#14161B",
      --           -- title = accent,
      --           border = "#3A3E47",
      --           current_line = "#1E222A",
      --           -- scrollbar = accent,
      --           selection = "#26343F",
      --           -- menu_selection = selection,
      --           highlight = "#23272F",
      --           none_text = "#3A3E47",
      --           text = "#9B9FA9",
      --           text_active = "#ADB0BB",
      --           text_inactive = "#494D56",
      --           text_match = "#E0E0Ee",
      --           prompt = "#21242A",
      --         },
      --         syntax = {
      --           red = "#e67e80",
      --           green = "#7da77e",
      --           yellow = "#dbbc8a",
      --           blue = "#8da0d6",
      --           cyan = "#559ba3",
      --           purple = "#817faf",
      --           orange = "#F5983A",
      --           text = "#bbbac1",
      --           comment = "#55555e",
      --           mute = "#111111",
      --         },
      --       },
      --     },
      --     highlights = {
      --       astrodark = {
      --         -- first parameter is the highlight table and the second parameter is the color palette table
      --         modify_hl_groups = function(hl, c) -- modify_hl_groups function allows you to modify hl groups,
      --           hl.Constant.fg = c.my_yellow
      --           -- hl.String.fg = c.my_green
      --         end,
      --         -- ["@String"] = { fg = "#ff00ff", bg = "NONE" },
      --         ["@property"] = my_cyan,
      --       },
      --     },
    },
  },
  -- {
  --   "cdmill/neomodern.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("neomodern").setup {
  --       -- optional configuration here
  --       style = "darkforest",
  --     }
  --     require("neomodern").load()
  --   end,
  -- },
}
