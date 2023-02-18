-- Configure require("lazy").setup() options
return function(config)
  vim.list_extend(config.spec, {
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
    { import = "user.plugins.extras.ui.minianimate" },
    { import = "user.plugins.extras.ui.noice" },
    { import = "user.plugins.extras.ui.pets" },
    { import = "user.plugins.extras.ui.zen-mode" },
    -- { import = "user.plugins.extras.ui.shade" },
    { import = "user.plugins.extras.ui.scrollbar" },
    { import = "user.plugins.extras.editor.minicomment" },
    -- { import = "user.plugins.extras.editor.lsplines" },
    { import = "user.plugins.extras.editor.grapple+portal" },
    { import = "user.plugins.extras.editor.copilot" },
    -- { import =  "user.plugins.extras.editor.textobjects" },
    { import = "user.plugins.extras.editor.miniai" },
    { import = "user.plugins.extras.editor.minisurround" },
    { import = "user.plugins.extras.editor.minimove" },
    { import = "user.plugins.extras.editor.trouble" },
    { import = "user.plugins.extras.editor.neoconf" },
    -- { import =  "user.plugins.extras.editor.copilot-cmp" },
    { import = "user.plugins.extras.editor.cutlass" },
    { import = "user.plugins.extras.editor.neogen" },
    -- { import =  "user.plugins.extras.editor.bqf" },
    { import = "user.plugins.extras.tools.oil" },
    { import = "user.plugins.extras.tools.overseer" },
    { import = "user.plugins.extras.tools.sniprun" },
    { import = "user.plugins.extras.tools.presence" },
    { import = "user.plugins.extras.tools.wakatime" },
    -- { import = "user.plugins.extras.tools.iron" },
    -- { import =  "user.plugins.extras.tools.refactoring" },
    -- { import =  "user.plugins.extras.tools.octo" },
    -- { import = "user.plugins.extras.tools.sg" },
    { import = "user.plugins.extras.tools.spectre" },
    -- { import = "user.plugins.extras.tools.fzf" },
  })
  return require("core.utils").extend_tbl(config, {
    -- whatever else you want to override with just a simple table merge
    defaults = { lazy = true },
    install = { colorscheme = { "onigiri" } },

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
