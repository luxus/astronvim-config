return {
  keys = {
    "<Plug>(simple-todo-above)",
    "<Plug>(simple-todo-below)",
    "<Plug>(simple-todo-mark-as-done)",
    "<Plug>(simple-todo-mark-as-undone)",
    "<Plug>(simple-todo-mark-switch)",
    "<Plug>(simple-todo-new-list-item)",
    "<Plug>(simple-todo-new-list-item-start-of-line)",
  },
  config = function() require "user.plugins.vim-simple-todo.config" end,
}
