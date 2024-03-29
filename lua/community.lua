-- Use most plugins only on my local machine
local host = "emily"

---@type LazySpec
return {
  -- TODO: Remove branch v4 on release
  { "AstroNvim/astrocommunity", branch = "v4" },
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  { import = "astrocommunity.pack.svelte", enable = (vim.fn.hostname() == host) },
  { import = "astrocommunity.pack.tailwindcss", enable = (vim.fn.hostname() == host) },
  -- { import = "astrocommunity.pack.astro", enable = (vim.fn.hostname() == host) },
  -- { import = "astrocommunity.pack.go", enable = (vim.fn.hostname() == host) },
  -- { import = "astrocommunity.pack.typescript-all-in-one", enable = (vim.fn.hostname() == host) },
  -- { import = "astrocommunity.pack.docker", enable = (vim.fn.hostname() == host) },
  -- { import = "astrocommunity.pack.rust", enable = (vim.fn.hostname() == host) },
  -- { import = "astrocommunity.pack.html-css", enable = (vim.fn.hostname() == host) },
  { import = "astrocommunity.pack.json", enable = (vim.fn.hostname() == host) },
  { import = "astrocommunity.pack.yaml", enable = (vim.fn.hostname() == host) },
  { import = "astrocommunity.lsp.nvim-lint", enable = (vim.fn.hostname() == host) },
  { import = "astrocommunity.editing-support.conform-nvim", enable = (vim.fn.hostname() == host) },
  -- { import = "astrocommunity.editing-support.yanky-nvim", enable = (vim.fn.hostname() == host) },

  { import = "astrocommunity.colorscheme.catppuccin", enabled = true },
  { import = "astrocommunity.completion.copilot-lua", enable = (vim.fn.hostname() == host) },
  { import = "astrocommunity.media.vim-wakatime", enable = (vim.fn.hostname() == host) },
  -- { import = "astrocommunity.code-runner.sniprun", enable = (vim.fn.hostname() == host) },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.nix" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.bash", enabled = false },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim", enabled = true },
  -- { import = "astrocommunity.lsp.inc-rename-nvim", enabled = true },
  { import = "astrocommunity.color.headlines-nvim" },
  -- { import = "astrocommunity.motion.mini-move", enabled = true },
  { import = "astrocommunity.motion.mini-surround", enabled = true },
  { import = "astrocommunity.motion.mini-bracketed", enabled = true },
  { import = "astrocommunity.motion.mini-ai" },
  -- { import = "astrocommunity.motion.grapple-nvim" },
  -- { import = "astrocommunity.editing-support.cloak-nvim" },
  -- { import = "astrocommunity.indent.mini-indentscope", enabled = true },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim", enabled = true },
  { import = "astrocommunity.comment.mini-comment", enabled = true },
  { import = "astrocommunity.project.nvim-spectre", enabled = true },
  -- { import = "astrocommunity.diagnostics.trouble-nvim", enabled = true },
  { import = "astrocommunity.editing-support.dial-nvim", enabled = true },
  { import = "astrocommunity.utility.noice-nvim", enabled = true },
  { import = "astrocommunity.scrolling.mini-animate", enabled = true },
  { import = "astrocommunity.fuzzy-finder.telescope-zoxide", enabled = false },
  -- { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.motion.portal-nvim", enabled = true },
  { import = "astrocommunity.editing-support.mini-splitjoin", enabled = true },
  -- { import = "astrocommunity.workflow.hardtime-nvim", enabled = true },
  { import = "astrocommunity.file-explorer.oil-nvim", enabled = true },
}
