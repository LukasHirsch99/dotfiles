return {
  cmd = {
    "pylsp",
  },
  filetypes = {
    "python",
  },
  root_markers = {
    ".git"
  },
  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
}
