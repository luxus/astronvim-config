local prefix = "<leader>S"
local prefix_fzf = "<leader>f"
return {
  {
    "nvim-telescope/telescope.nvim",
    enabled = false,
  },
  {
    "Shatur/neovim-session-manager",
    enabled = false,
  },
  {
    "gennaro-tedesco/nvim-possession",
    event = "VeryLazy",
    opts = {
      autosave = true,
      autoswitch = {
        enabled = true,
      },
      -- autoload = true,
    },
    keys = {
      { prefix, desc = "Session" },
      { prefix .. "f", function() require("nvim-possession").list() end, desc = "List Sessions" },
      { prefix .. "n", function() require("nvim-possession").new() end, desc = "New Session" },
      { prefix .. "l", function() require("nvim-possession").update() end, desc = "Save Session" },
    },
    dependencies = {
      {
        "ibhagwan/fzf-lua",
        opts = {
          fzf_bin = "sk",
          winopts = {
            border = "none",
            preview = {
              default = "bat",
              scrollbar = false,
              winopts = { -- builtin previewer window options
                number = false,
              },
            },
          },
          previewers = {
            builtin = {
              extensions = {
                -- neovim terminal only supports `viu` block output
                ["png"] = { "viu", "-b" },
              },
            },
          },
        },
        keys = {
          {
            "<tab>",
            function() require("fzf-lua").buffers() end,
            desc = "Buffers",
          },
          { prefix_fzf .. "b", function() require("fzf-lua").buffers() end, desc = "Buffers" },
          { prefix_fzf .. "h", function() require("fzf-lua").help_tags() end, desc = "Help Tags" },
          { prefix_fzf .. "m", function() require("fzf-lua").marks() end, desc = "Marks" },
          { prefix_fzf .. "r", function() require("fzf-lua").registers() end, desc = "Registers" },
          { prefix_fzf .. "t", function() require("fzf-lua").tags() end, desc = "Tags" },
          { prefix_fzf .. "T", function() require("fzf-lua").tags { cwd_only = true } end, desc = "Tags (cwd)" },
          { prefix_fzf .. "k", function() require("fzf-lua").keymaps() end, desc = "Keymaps" },
          {
            prefix_fzf .. "K",
            function() require("fzf-lua").keymaps { builtin_only = true } end,
            desc = "Keymaps (builtin)",
          },
          { prefix_fzf .. "s", function() require("fzf-lua").spell_suggest() end, desc = "Spell Suggest" },
          {
            prefix_fzf .. "S",
            function() require("fzf-lua").spell_suggest { all = true } end,
            desc = "Spell Suggest (all)",
          },
          { prefix_fzf .. "a", function() require("fzf-lua").autocmds() end, desc = "Autocmds" },
          {
            prefix_fzf .. "A",
            function() require("fzf-lua").autocmds { cwd_only = true } end,
            desc = "Autocmds (cwd)",
          },
          { prefix_fzf .. "v", function() require("fzf-lua").vim_options() end, desc = "Vim Options" },
          {
            prefix_fzf .. "V",
            function() require("fzf-lua").vim_options { cwd_only = true } end,
            desc = "Vim Options (cwd)",
          },
          {
            prefix_fzf .. "o",
            function() require("fzf-lua").vim_options { cwd_only = true, builtin_only = true } end,
            desc = "Vim Options (builtin)",
          },
          {
            prefix_fzf .. "p",
            function() require("fzf-lua").vim_options { cwd_only = true, builtin_only = true, show_hidden = true } end,
            desc = "Vim Options (builtin, hidden)",
          },
          {
            prefix_fzf .. "P",
            function() require("fzf-lua").vim_options { cwd_only = true, show_hidden = true } end,
            desc = "Vim Options (cwd, hidden)",
          },
          { prefix_fzf .. "q", function() require("fzf-lua").quickfix() end, desc = "Quickfix" },
          {
            prefix_fzf .. "Q",
            function() require("fzf-lua").quickfix { cwd_only = true } end,
            desc = "Quickfix (cwd)",
          },
          { prefix_fzf .. "l", function() require("fzf-lua").loclist() end, desc = "Loclist" },
          { prefix_fzf .. "L", function() require("fzf-lua").loclist { cwd_only = true } end, desc = "Loclist (cwd)" },
          { prefix_fzf .. "d", function() require("fzf-lua").filetypes() end, desc = "Filetypes" },
          {
            prefix_fzf .. "D",
            function() require("fzf-lua").filetypes { cwd_only = true } end,
            desc = "Filetypes (cwd)",
          },
          {
            prefix_fzf .. "e",
            function() require("fzf-lua").filetypes { cwd_only = true, show_hidden = true } end,
            desc = "Filetypes (cwd, hidden)",
          },
          {
            prefix_fzf .. "E",
            function() require("fzf-lua").filetypes { show_hidden = true } end,
            desc = "Filetypes (hidden)",
          },
          {
            prefix_fzf .. "i",
            function() require("fzf-lua").filetypes { cwd_only = true, show_hidden = true, builtin_only = true } end,
            desc = "Filetypes (builtin, cwd, hidden)",
          },
          {
            prefix_fzf .. "I",
            function() require("fzf-lua").filetypes { show_hidden = true, builtin_only = true } end,
            desc = "Filetypes (builtin, hidden)",
          },
          {
            prefix_fzf .. "j",
            function() require("fzf-lua").filetypes { cwd_only = true, builtin_only = true } end,
            desc = "Filetypes (builtin, cwd)",
          },
          {
            prefix_fzf .. "J",
            function() require("fzf-lua").filetypes { builtin_only = true } end,
            desc = "Filetypes (builtin)",
          },
          {
            prefix_fzf .. "n",
            function() require("fzf-lua").filetypes { cwd_only = true, show_hidden = true, show_dev = true } end,
            desc = "Filetypes (dev, cwd, hidden)",
          },
          {
            prefix_fzf .. "N",
            function() require("fzf-lua").filetypes { show_hidden = true, show_dev = true } end,
            desc = "Filetypes (dev, hidden)",
          },
          {
            prefix_fzf .. "u",
            function() require("fzf-lua").filetypes { cwd_only = true, show_dev = true } end,
            desc = "Filetypes (dev, cwd)",
          },
          {
            prefix_fzf .. "U",
            function() require("fzf-lua").filetypes { show_dev = true } end,
            desc = "Filetypes (dev)",
          },
          {
            prefix_fzf .. "C",
            function() require("fzf-lua").commands { cwd_only = true } end,
            desc = "Commands (cwd)",
          },

          {
            prefix_fzf .. "f",
            function() require("fzf-lua").files() end,
            desc = "Search File",
          },
          {
            prefix_fzf .. "w",
            function() require("fzf-lua").live_grep_native { exec_empty_query = true } end,
            desc = "Search Word",
          },
          {
            prefix_fzf .. "o",
            function() require("fzf-lua").oldfiles { cwd_only = true } end,
            desc = "FZF",
          },
          {
            prefix_fzf .. "g",
            function() require("fzf-lua").live_grep { cmd = "git grep --line-number --column --color=always" } end,
            desc = "Git Search",
          },

          {
            prefix_fzf .. "c",
            function() require("fzf-lua").colorschemes { winopts = { height = 0.33, width = 0.33 } } end,
            desc = "Colorschemes",
          },
        },
      },
    },
  },
}
