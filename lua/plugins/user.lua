---@type LazySpec
return {
  { "better-escape.nvim", enabled = false },
  { "LuaSnip", enabled = false },
  {
    "nightfox.nvim",
    optional = true,
    opts = {
      options = {
        dim_inactive = false,
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
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
      current_line_blame = true,
      current_line_blame_opts = { ignore_whitespace = true },
      numhl = true,
      -- signcolumn = false,
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
  -- {
  --   "astrotheme",
  --   opts = {
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
  --   },
  -- },
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
