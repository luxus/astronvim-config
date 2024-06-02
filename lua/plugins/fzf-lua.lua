-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local astro = require "astrocore"
        local is_available = astro.is_available
        local maps = opts.mappings
        local fzf = require "fzf-lua"
        local prefix = "<Leader>f"
        maps.n[prefix .. "f"] = { function() fzf.files() end, desc = "Find files" }
        maps.n[prefix .. "<CR>"] = { function() fzf.resume() end, desc = "Resume previous search" }
        maps.n[prefix .. "w"] = { function() fzf.live_grep_native() end, desc = "Find words" }
        maps.n[prefix .. "b"] = { function() fzf.buffers() end, desc = "Find buffers" }
        maps.n[prefix .. "/"] = { function() fzf.lgrep_curbuf() end, desc = "Find words in current buffer" }
        maps.n[prefix .. "'"] = { function() fzf.marks() end, desc = "Find marks" }
        maps.n[prefix .. "o"] = { function() fzf.oldfiles() end, desc = "Find history" }
        maps.n[prefix .. "m"] = { function() fzf.manpages() end, desc = "Find man" }
        maps.n[prefix .. "C"] = { function() fzf.commands() end, desc = "Find commands" }
        maps.n[prefix .. "c"] = { function() fzf.colorschemes() end, desc = "Find colorschemes" }
        maps.n[prefix .. "h"] = { function() fzf.helptags() end, desc = "Find help" }
        maps.n[prefix .. "r"] = { function() fzf.registers() end, desc = "Find registers" }
        maps.n[prefix .. "c"] = { function() fzf.grep_cword() end, desc = "Find word under cursor" }
        maps.n["<Leader>ls"] = {
          function()
            if is_available "aerial.nvim" then
              require("telescope").extensions.aerial.aerial()
            else
              fzf.lsp_document_symbols()
            end
          end,
          desc = "Search symbols",
        }
        if vim.fn.executable "git" == 1 then
          maps.n["<Leader>g"] = vim.tbl_get(opts, "_map_sections", "g")
          maps.n["<Leader>gb"] = { function() fzf.git_branches() end, desc = "Git Branches" }
          maps.n["<Leader>gc"] = {
            function() fzf.git_commits() end,
            desc = "Git commits (repository)",
          }
          maps.n["<Leader>gC"] = {
            function() fzf.git_bcommits() end,
            desc = "Git commits (current file)",
          }
          maps.n["<Leader>gt"] = { function() fzf.git_status() end, desc = "Git status" }
        end
        maps.n[prefix .. "a"] =
          { function() fzf.files { cwd = vim.fn.stdpath "config" } end, desc = "Find config files" }
      end,
    },
    { "nvim-tree/nvim-web-devicons" },
  },
  opts = {},
}
