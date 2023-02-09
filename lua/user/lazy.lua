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
    -- Animation plugins
    { import = "user.plugins.extras.ui.minianimate", enabled = GUI() },
    { import = "user.plugins.extras.ui.noice", enabled = GUI() },
    -- Language plugins
    { import = "user.plugins.extras.lang.go" },
    { import = "user.plugins.extras.lang.rust" },
    { import = "user.plugins.extras.lang.python" },
    { import = "user.plugins.extras.lang.nix" },
    { import = "user.plugins.extras.lang.lua" },
    { import = "user.plugins.extras.lang.typescript" },
    { import = "user.plugins.extras.lang.clangd" },
    { import = "user.plugins.extras.lang.json" },
    { import = "user.plugins.extras.lang.sql" },
    { import = "user.plugins.extras.lang.shell" },
    -- { import = "user.plugins.extras.lang.tex" },
    { import = "user.plugins.extras.ui.ministarter" },
    { import = "user.plugins.extras.ui.ccc" },
    { import = "user.plugins.extras.ui.drop" },
    { import = "user.plugins.extras.ui.zen-mode" },
    -- { import = "user.plugins.extras.ui.shade" },
    -- { import =  "user.plugins.extras.ui.modicator" },
    -- { import =  "user.plugins.extras.ui.scrollbar" },
    { import = "user.plugins.extras.editor.minicomment" },
    { import = "user.plugins.extras.editor.grapple+portal" },
    { import = "user.plugins.extras.editor.copilot" },
    -- { import =  "user.plugins.extras.editor.textobjects" },
    { import = "user.plugins.extras.editor.miniai" },
    { import = "user.plugins.extras.editor.minisurround" },
    { import = "user.plugins.extras.editor.minimove" },
    { import = "user.plugins.extras.editor.neoconf" },
    -- { import =  "user.plugins.extras.editor.copilot-cmp" },
    { import = "user.plugins.extras.editor.cutlass" },
    -- { import = "user.plugins.extras.editor.neogen" },
    -- { import =  "user.plugins.extras.editor.bqf" },
    { import = "user.plugins.extras.tools.oil" },
    { import = "user.plugins.extras.tools.overseer" },
    { import = "user.plugins.extras.tools.presence" },
    { import = "user.plugins.extras.tools.wakatime" },
    -- { import = "user.plugins.extras.tools.iron" },
    -- { import =  "user.plugins.extras.tools.refactoring" },
    -- { import =  "user.plugins.extras.tools.octo" },
    -- { import = "user.plugins.extras.tools.sg" },
    { import = "user.plugins.extras.tools.spectre" },
  })
  return astronvim.extend_tbl(config, {
    -- whatever else you want to override with just a simple table merge
    defaults = { lazy = true },
    install = { colorscheme = { "everforest" } },
    checker = { enabled = true }, -- automatically check for plugin updatesnoice
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = {
          "nvim-treesitter-textobjects",
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
