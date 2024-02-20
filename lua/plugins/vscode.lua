if not vim.g.vscode then return {} end

local enabled = {
  "lazy.nvim",
  "Comment.nvim",
  "nvim-autopairs",
  "nvim-treesitter",
  "nvim-ts-autotag",
  "nvim-treesitter-textobjects",
  "nvim-ts-context-commentstring",
  "astrocore",
  "astroui",
}

local Config = require "lazy.core.config"
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
Config.options.defaults.cond = function(plugin) return vim.tbl_contains(enabled, plugin.name) or plugin.vscode end

---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<Leader>ff"] = "<CMD>Find<CR>",
          ["<Leader>fw"] = "<CMD>call VSCodeNotify('workbench.action.findInFiles')<CR>",
          ["<Leader>ls"] = "<CMD>call VSCodeNotify('workbench.action.gotoSymbol')<CR>",
        },
      },
    },
  },
  { "AstroNvim/astroui", opts = { colorscheme = false } },
  { "nvim-treesitter/nvim-treesitter", opts = { highlight = { enable = false } } },
}

-- local function notify(cmd) return string.format("<cmd>call VSCodeNotify('%s')<CR>", cmd) end
-- local function v_notify(cmd) return string.format("<cmd>call VSCodeNotifyVisual('%s', 1)<CR>", cmd) end
-- keymap("n", "<Leader>e", notify "workbench.view.explorer", { silent = true })
-- keymap("n", "<Leader>xr", notify "references-view.findReferences", { silent = true }) -- language references
-- keymap("n", "<Leader>xd", notify "workbench.actions.view.problems", { silent = true }) -- language diagnostics
-- keymap("n", "gr", notify "editor.action.goToReferences", { silent = true })
-- keymap("n", "<Leader>rn", notify "editor.action.rename", { silent = true })
-- keymap("n", "<Leader>lf", notify "editor.action.formatDocument", { silent = true })
-- keymap("n", "<Leader>ca", notify "editor.action.refactor", { silent = true }) -- language code actions
--
-- keymap("n", "<Leader>fw", notify "workbench.action.findInFiles", { silent = true }) -- use ripgrep to search files
-- keymap("n", "<Leader>ts", notify "workbench.action.toggleSidebarVisibility", { silent = true })
-- keymap("n", "<Leader>th", notify "workbench.action.toggleAuxiliaryBar", { silent = true }) -- toggle docview (help page)
-- keymap("n", "<Leader>tp", notify "workbench.action.togglePanel", { silent = true })
-- keymap("n", "<Leader>fc", notify "workbench.action.showCommands", { silent = true }) -- find commands
-- keymap("n", "<Leader>ff", notify "workbench.action.quickOpen", { silent = true }) -- find files
-- keymap("n", "<Leader>tw", notify "workbench.action.terminal.toggleTerminal", { silent = true }) -- terminal window
--
-- keymap("v", "<Leader>fm", v_notify "editor.action.formatSelection", { silent = true })
-- keymap("v", "<Leader>ca", v_notify "editor.action.refactor", { silent = true })
-- keymap("v", "<Leader>fc", v_notify "workbench.action.showCommands", { silent = true })
--
