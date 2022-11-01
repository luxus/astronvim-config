require("nvim-surround").setup {
  keymaps = {
    insert = "<C-g>s",
    insert_line = "<C-g>S",
    normal = "sa",
    normal_cur = "ssa",
    normal_line = "Sa",
    normal_cur_line = "SSa",
    visual = "sa",
    visual_line = "gsa",
    delete = "sd",
    change = "sr",
  },
}
