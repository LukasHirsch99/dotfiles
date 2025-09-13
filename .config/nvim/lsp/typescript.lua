return {
  cmd = {
    "typescript-language-server", "--stdio",
  },
  filetypes = {
    "typescript",
    "javascript",
    "typescriptreact",
    "javascriptreact"
  },
  root_markers = {
    ".git"
  },
  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
}
