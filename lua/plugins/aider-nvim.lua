if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  {
    "aweis89/aider.nvim",
    event = "User AstroFile",
    dependencies = {
      -- { "nvim-telescope/telescope.nvim" },
      -- { "ibhagwan/fzf-lua" },
      "willothy/flatten.nvim", -- required for /editor command functionality
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          local prefix = "<Leader>a"
          maps.n[prefix .. "<space>"] = { "<cmd>AiderToggle<CR>", desc = "Toggle Aider" }
          maps.n[prefix .. "l"] = { "<cmd>AiderLoad<CR>", desc = "Add file to aider" }
          maps.n[prefix .. "d"] = { "<cmd>AiderToggle<CR>", desc = "ask with selection" }
          maps.v[prefix .. "d"] = { "<cmd>AiderToggle<CR>", desc = "ask with selection" }
        end,
      },
    },
    opts = {},
  },
}
