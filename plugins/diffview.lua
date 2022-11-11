local actions = require "diffview.actions"

astronvim.which_key_register {
  n = {
    ["<leader>"] = {
      d = {
        name = "Diff View",
        ["<cr>"] = { "<cmd>DiffviewOpen<cr>", "Open DiffView" },
        h = { "<cmd>DiffviewFileHistory %<cr>", "Open DiffView File History" },
        H = { "<cmd>DiffviewFileHistory<cr>", "Open DiffView Branch History" },
      },
    },
  },
}

local build_keymaps = function(maps)
  local out = {}
  local i = 1
  for lhs, def in
    pairs(astronvim.default_tbl({
      ["<leader>dq"] = { "<cmd>DiffviewClose<cr>", desc = "Quit Diffview" }, -- Toggle the file panel.
      ["]D"] = { actions.select_next_entry, desc = "Next Difference" }, -- Open the diff for the next file
      ["[D"] = { actions.select_prev_entry, desc = "Previous Difference" }, -- Open the diff for the previous file
      ["[C"] = { actions.prev_conflict, desc = "Next Conflict" }, -- In the merge_tool: jump to the previous conflict
      ["]C"] = { actions.next_conflict, desc = "Previous Conflict" }, -- In the merge_tool: jump to the next conflict
      ["Cl"] = { actions.cycle_layout, desc = "Cycle Diff Layout" }, -- Cycle through available layouts.
      ["Ct"] = { actions.listing_style, desc = "Cycle Tree Style" }, -- Cycle through available layouts.
      ["<leader>e"] = { actions.toggle_files, desc = "Toggle Explorer" }, -- Toggle the file panel.
      ["<leader>o"] = { actions.focus_files, desc = "Focus Explorer" }, -- Bring focus to the file panel
    }, maps))
  do
    local opts
    local rhs = def
    local mode = { "n" }
    if type(def) == "table" then
      if def.mode then mode = def.mode end
      rhs = def[1]
      def[1] = nil
      def.mode = nil
      opts = def
    end
    out[i] = { mode, lhs, rhs, opts }
    i = i + 1
  end
  return out
end

require("diffview").setup {
  view = {
    merge_tool = { layout = "diff3_mixed" },
  },
  keymaps = {
    disable_defaults = true,
    view = build_keymaps {
      ["<leader>do"] = { actions.conflict_choose "ours", desc = "Take Ours" }, -- Choose the OURS version of a conflict
      ["<leader>dt"] = { actions.conflict_choose "theirs", desc = "Take Theirs" }, -- Choose the THEIRS version of a conflict
      ["<leader>db"] = { actions.conflict_choose "base", desc = "Take Base" }, -- Choose the BASE version of a conflict
      ["<leader>da"] = { actions.conflict_choose "all", desc = "Take All" }, -- Choose all the versions of a conflict
      ["<leader>d0"] = { actions.conflict_choose "none", desc = "Take None" }, -- Delete the conflict region
    },
    diff3 = build_keymaps {
      ["<leader>dO"] = { actions.diffget "ours", mode = { "n", "x" }, desc = "Get Our Diff" }, -- Obtain the diff hunk from the OURS version of the file
      ["<leader>dT"] = { actions.diffget "theirs", mode = { "n", "x" }, desc = "Get Their Diff" }, -- Obtain the diff hunk from the THEIRS version of the file
    },
    diff4 = build_keymaps {
      ["<leader>dB"] = { actions.diffget "base", mode = { "n", "x" }, desc = "Get Base Diff" }, -- Obtain the diff hunk from the OURS version of the file
      ["<leader>dO"] = { actions.diffget "ours", mode = { "n", "x" }, desc = "Get Our Diff" }, -- Obtain the diff hunk from the OURS version of the file
      ["<leader>dT"] = { actions.diffget "theirs", mode = { "n", "x" }, desc = "Get Their Diff" }, -- Obtain the diff hunk from the THEIRS version of the file
    },
    file_panel = build_keymaps {
      j = actions.next_entry, -- Bring the cursor to the next file entry
      k = actions.prev_entry, -- Bring the cursor to the previous file entry.
      o = actions.select_entry,
      S = actions.stage_all, -- Stage all entries.
      U = actions.unstage_all, -- Unstage all entries.
      X = actions.restore_entry, -- Restore entry to the state on the left side.
      L = actions.open_commit_log, -- Open the commit log panel.
      Cf = { actions.toggle_flatten_dirs, desc = "Flatten" }, -- Flatten empty subdirectories in tree listing style.
      R = actions.refresh_files, -- Update stats and entries in the file list.
      ["-"] = actions.toggle_stage_entry, -- Stage / unstage the selected entry.
      ["<down>"] = actions.next_entry,
      ["<up>"] = actions.prev_entry,
      ["<cr>"] = actions.select_entry, -- Open the diff for the selected entry.
      ["<2-LeftMouse>"] = actions.select_entry,
      ["<c-b>"] = actions.scroll_view(-0.25), -- Scroll the view up
      ["<c-f>"] = actions.scroll_view(0.25), -- Scroll the view down
      ["<tab>"] = actions.select_next_entry,
      ["<s-tab>"] = actions.select_prev_entry,
    },
    file_history_panel = build_keymaps {
      j = actions.next_entry,
      k = actions.prev_entry,
      o = actions.select_entry,
      y = actions.copy_hash, -- Copy the commit hash of the entry under the cursor
      L = actions.open_commit_log,
      zR = { actions.open_all_folds, desc = "Open all folds" },
      zM = { actions.close_all_folds, desc = "Close all folds" },
      ["?"] = { actions.options, desc = "Options" }, -- Open the option panel
      ["<down>"] = actions.next_entry,
      ["<up>"] = actions.prev_entry,
      ["<cr>"] = actions.select_entry,
      ["<2-LeftMouse>"] = actions.select_entry,
      ["<C-A-d>"] = actions.open_in_diffview, -- Open the entry under the cursor in a diffview
      ["<c-b>"] = actions.scroll_view(-0.25),
      ["<c-f>"] = actions.scroll_view(0.25),
      ["<tab>"] = actions.select_next_entry,
      ["<s-tab>"] = actions.select_prev_entry,
    },
    option_panel = {
      q = actions.close,
      o = actions.select_entry,
      ["<cr>"] = actions.select_entry,
      ["<2-LeftMouse"] = actions.select_entry,
    },
  },
}
