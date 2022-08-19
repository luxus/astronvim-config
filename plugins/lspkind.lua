return function(config)
  config.preset = "codicons"
  config.symbol_map = {
    Array = "",
    Boolean = "",
    Key = "",
    Namespace = "",
    Null = "",
    Number = "",
    Object = "",
    Package = "",
    String = "",
    -- UI Elements
    ActiveLSP = "",
    ActiveTS = " ",
    DefaultFile = "",
    DiagnosticError = "",
    DiagnosticHint = "",
    DiagnosticInfo = "",
    DiagnosticWarn = "",
    FileModified = "",
    FileReadOnly = "",
    FolderClosed = "",
    FolderEmpty = "",
    FolderOpen = "",
    GitAdd = "",
    GitBranch = "",
    GitChange = "",
    GitConflict = "",
    GitDelete = "",
    GitIgnored = "",
    GitRenamed = "",
    GitStaged = "",
    GitUnstaged = "",
    GitUntracked = "",
  }
  return config
end
