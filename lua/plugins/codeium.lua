if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  {
    "monkoose/neocodeium",
    event = "InsertEnter",
    enabled = true,

    opts = {},
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            i = {
              ["<A-f>"] = { function() require("neocodeium").accept() end, desc = "Codeium accept" },
              ["<A-w>"] = { function() require("neocodeium").accept_word() end, desc = "Codeium accept word" },
              ["<A-a>"] = { function() require("neocodeium").accept_line() end, desc = "Codeium accept line" },
              ["<A-e>"] = {
                function() require("neocodeium").cycle_or_complete() end,
                desc = "Codeium cycle or complete",
              },
              ["<A-r>"] = {
                function() require("neocodeium").cycle_or_complete(-1) end,
                desc = "Codeium cycle or complete reverse",
              },
              ["<A-c>"] = { function() require("neocodeium").clear() end, desc = "Codeium clear" },
            },
          },
          autocmds = {
            codeium = {
              event = "User",
              pattern = "NeoCodeiumCompletionDisplayed",
              callback = function() require("cmp").abort() end,
            },
          },
        },
      },
    },
  },
}
