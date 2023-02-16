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
    init = function() require("which-key").register({ ["<leader>S"] = { name = "Sessions" } }, { mode = "n" }) end,
    opts = {
      autosave = true,
      autoswitch = {
        enabled = true,
      },
      -- autoload = true,
    },
    keys = {
      { "<leader>Sf", function() require("nvim-possession").list() end, desc = "List Sessions" },
      { "<leader>Sn", function() require("nvim-possession").new() end, desc = "New Session" },
      { "<leader>Sl", function() require("nvim-possession").update() end, desc = "Save Session" },
    },
    dependencies = {
      {
        "ibhagwan/fzf-lua",
        opts = {
          fzf_bin = "sk",
          winopts = {
            border = "none",
            preview = {
              -- default = "bat",
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
          {
            "<leader>ff",
            function() require("fzf-lua").files() end,
            desc = "Search File",
          },
          {
            "<leader>fw",
            function() require("fzf-lua").live_grep_native { exec_empty_query = true } end,
            desc = "Search Word",
          },
          {
            "<leader>fo",
            function() require("fzf-lua").oldfiles { cwd_only = true } end,
            desc = "FZF",
          },
          {
            "<leader>fg",
            function() require("fzf-lua").live_grep { cmd = "git grep --line-number --column --color=always" } end,
            desc = "Git Search",
          },

          {
            "<leader>fc",
            function() require("fzf-lua").colorschemes { winopts = { height = 0.33, width = 0.33 } } end,
            desc = "Colorschemes",
          },
        },
      },
    },
  },
}
