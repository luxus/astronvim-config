-- Check if nvim has been opened with neovide
function GUI()
  if vim.g.neovide then
    return false
  else
    return true
  end
end
-- Configure require("lazy").setup() options

return function(config)
  vim.list_extend(config.spec, {
    { import = "user.plugins.extras.lang.go", enabled = true },
    { import = "user.plugins.extras.lang.rust", enabled = true },
    { import = "user.plugins.extras.lang.python", enabled = false },
    { import = "user.plugins.extras.lang.nix", enabled = true },
    { import = "user.plugins.extras.lang.lua", enabled = true },
    { import = "user.plugins.extras.lang.typescript", enabled = false },
    { import = "user.plugins.extras.lang.clangd", enabled = false },
    { import = "user.plugins.extras.lang.json", enabled = false },
    { import = "user.plugins.extras.lang.sql", enabled = false },
    { import = "user.plugins.extras.lang.shell", enabled = true },
    { import = "user.plugins.extras.lang.tex", enabled = false },
    { import = "user.plugins.extras.ui.ministarter", enabled = true },
    { import = "user.plugins.extras.ui.ccc", enabled = false },
    { import = "user.plugins.extras.ui.drop", enabled = GUI() },
    { import = "user.plugins.extras.ui.minianimate", enabled = GUI() },
    { import = "user.plugins.extras.ui.noice", enabled = GUI() },
    { import = "user.plugins.extras.ui.glow", enabled = false },
    { import = "user.plugins.extras.ui.pets", enabled = true },
    { import = "user.plugins.extras.ui.zen-mode", enabled = true },
    { import = "user.plugins.extras.ui.tint", enabled = false },
    { import = "user.plugins.extras.ui.scrollbar", enabled = true },
    { import = "user.plugins.extras.ui.smartcolumn", enabled = true },
    { import = "user.plugins.extras.editor.minicomment", enabled = true },
    { import = "user.plugins.extras.editor.lsplines", enabled = false },
    { import = "user.plugins.extras.editor.grapple+portal", enabled = true },
    { import = "user.plugins.extras.editor.copilot", enabled = true },
    { import = "user.plugins.extras.editor.copilot-cmp", enabled = false },
    { import = "user.plugins.extras.editor.textobjects", enabled = false },
    { import = "user.plugins.extras.editor.miniai", enabled = true },
    { import = "user.plugins.extras.editor.minisurround", enabled = true },
    { import = "user.plugins.extras.editor.minimove", enabled = true },
    { import = "user.plugins.extras.editor.trouble", enabled = true },
    { import = "user.plugins.extras.editor.neoconf", enabled = true },
    { import = "user.plugins.extras.editor.cutlass", enabled = true },
    { import = "user.plugins.extras.editor.neogen", enabled = false },
    { import = "user.plugins.extras.editor.bqf", enabled = false },
    { import = "user.plugins.extras.tools.presence", enabled = true },
    { import = "user.plugins.extras.tools.chatgpt", enabled = true },
    { import = "user.plugins.extras.tools.wakatime", enabled = true },
    { import = "user.plugins.extras.tools.spectre", enabled = true },
    { import = "user.plugins.extras.tools.iron", enabled = false },
    { import = "user.plugins.extras.tools.neural", enabled = true },
    { import = "user.plugins.extras.tools.refactoring", enabled = false },
    { import = "user.plugins.extras.tools.octo", enabled = false },
    { import = "user.plugins.extras.tools.sg", enabled = false },
    { import = "user.plugins.extras.tools.fzf", enabled = false },
    { import = "user.plugins.extras.tools.oil", enabled = false },
    { import = "user.plugins.extras.tools.overseer", enabled = false },
    { import = "user.plugins.extras.tools.sniprun", enabled = false },
  })
  return require("core.utils").extend_tbl(config, {
    -- whatever else you want to override with just a simple table merge
    defaults = { lazy = true },
    checker = { enabled = true }, -- automatically check for plugin updates
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = {
          "tohtml",
          "gzip",
          "matchit",
          "zipPlugin",
          "netrwPlugin",
          "tarPlugin",
          "matchparen",
        },
      },
    },
    diff = { cmd = "terminal_git" },
  })
end
