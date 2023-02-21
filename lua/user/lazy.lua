return function(config)
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
