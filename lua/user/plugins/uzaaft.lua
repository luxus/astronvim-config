local user = vim.env.USER
if user and user ~= "uzaaft" then
  return {}
else
  return {
    { import = "astrocommunity.colorscheme.github-nvim-theme", enabled = true },
    { import = "astrocommunity.pack.rust", enabled = true },
    { import = "astrocommunity.pack.typescript", enabled = false },
    { import = "astrocommunity.pack.python", enabled = false },
    {
      "dmmulroy/tsc.nvim",
      filetype = "typescript",
      event = "User AstroFile",
      config = function() require("tsc").setup() end,
    },
    {
      "gaoDean/autolist.nvim",
      ft = {
        "markdown",
        "text",
        "tex",
        "plaintex",
      },
      config = function()
        local autolist = require "autolist"
        autolist.setup()
        autolist.create_mapping_hook("i", "<CR>", autolist.new)
        autolist.create_mapping_hook("i", "<Tab>", autolist.indent)
        autolist.create_mapping_hook("i", "<S-Tab>", autolist.indent, "<C-D>")
        autolist.create_mapping_hook("n", "o", autolist.new)
        autolist.create_mapping_hook("n", "O", autolist.new_before)
        autolist.create_mapping_hook("n", ">>", autolist.indent)
        autolist.create_mapping_hook("n", "<<", autolist.indent)
        autolist.create_mapping_hook("n", "<C-r>", autolist.force_recalculate)
        autolist.create_mapping_hook("n", "<leader>x", autolist.invert_entry, "")
      end,
    },
  }
end
