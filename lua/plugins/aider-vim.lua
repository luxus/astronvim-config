if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "nekowasabi/aider.vim",
  lazy = false,
  config = function() end,
  dependencies = {
    { "vim-denops/denops.vim" },
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local prefix = "<Leader>a"
        local g = opts.options.g
        local maps = opts.mappings
        g.aider_command = "aider --no-auto-commits"
        g.aider_buffer_open_type = "float"
        g.aider_floatwin_width = 100
        g.aider_floatwin_height = 20
        opts.autocmds.aider_open = {
          event = "User",
          pattern = "AiderOpen",
          desc = "Autocommand group for Aider",
          group = "AiderOpenGroup",
          callback = function(args)
            vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { buffer = args.buf })
            vim.keymap.set("n", "<Esc>", "<cmd>AiderHide<CR>", { buffer = args.buf })
          end,
        }

        maps.n[prefix .. "r"] = { ":AiderRun<CR>", desc = "aiderRun" }
        maps.n[prefix .. "a"] = { ":AiderAddCurrentFile<CR>", desc = "aider AiderAddCurrentFile" }
        maps.n[prefix .. "w"] = { ":AiderAddWeb<CR>", desc = "AiderAddWeb" }
        maps.n[prefix .. "x"] = { ":AiderExit<CR>", desc = "AiderExit" }
        maps.n[prefix .. "i"] = { ":AiderAddIgnoreCurrentFile<CR>", desc = "AiderAddIgnoreCurrentFile" }
        maps.n[prefix .. "I"] = { ":AiderOpenIgnore<CR>", desc = "AiderOpenIgnore" }
        maps.n[prefix .. "h"] = { ":AiderHide<CR>", desc = "AiderHide" }
        maps.v[prefix .. "v"] = { ":AiderVisualTextWithPrompt<CR>", desc = "AiderVisualTextWithPrompt" }
      end,
    },
  },
}
