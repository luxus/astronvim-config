return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "andymass/vim-matchup",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  opts = {
    auto_install = vim.fn.executable "tree-sitter" == 1,
    highlight = { disable = { "help" } },
    indent = { enable = true, disable = { "python" } },
    matchup = { enable = true },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          aB = "@block.outer",
          iB = "@block.inner",
          aC = "@conditional.outer",
          iC = "@conditional.inner",
          aF = "@function.outer",
          iF = "@function.inner",
          aL = "@loop.outer",
          iL = "@loop.inner",
          aP = "@parameter.outer",
          iP = "@parameter.inner",
          aX = "@class.outer",
          iX = "@class.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]b"] = { query = "@block.outer", desc = "Next block start" },
          ["]f"] = { query = "@function.outer", desc = "Next function start" },
          ["]p"] = { query = "@parameter.outer", desc = "Next parameter start" },
          ["]x"] = { query = "@class.outer", desc = "Next class start" },
        },
        goto_next_end = {
          ["]B"] = { query = "@block.outer", desc = "Next block end" },
          ["]F"] = { query = "@function.outer", desc = "Next function end" },
          ["]P"] = { query = "@parameter.outer", desc = "Next parameter end" },
          ["]X"] = { query = "@class.outer", desc = "Next class end" },
        },
        goto_previous_start = {
          ["[b"] = { query = "@block.outer", desc = "Previous block start" },
          ["[f"] = { query = "@function.outer", desc = "Previous function start" },
          ["[p"] = { query = "@parameter.outer", desc = "Previous parameter start" },
          ["[x"] = { query = "@class.outer", desc = "Previous class start" },
        },
        goto_previous_end = {
          ["[B"] = { query = "@block.outer", desc = "Previous block end" },
          ["[F"] = { query = "@function.outer", desc = "Previous function end" },
          ["[P"] = { query = "@parameter.outer", desc = "Previous parameter end" },
          ["[X"] = { query = "@class.outer", desc = "Previous class end" },
        },
      },
      swap = {
        enable = true,
        swap_next = {
          [">B"] = { query = "@block.outer", desc = "Swap next block" },
          [">F"] = { query = "@function.outer", desc = "Swap next function" },
          [">P"] = { query = "@parameter.inner", desc = "Swap next parameter" },
        },
        swap_previous = {
          ["<B"] = { query = "@block.outer", desc = "Swap previous block" },
          ["<F"] = { query = "@function.outer", desc = "Swap previous function" },
          ["<P"] = { query = "@parameter.inner", desc = "Swap previous parameter" },
        },
      },
      lsp_interop = {
        enable = true,
        border = "single",
        peek_definition_code = {
          ["<leader>lp"] = { query = "@function.outer", desc = "Peek function definition" },
          ["<leader>lP"] = { query = "@class.outer", desc = "Peek class definition" },
        },
      },
    },
  },
}
