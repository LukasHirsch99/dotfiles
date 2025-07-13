return {
  cmd = {
    "glsl_analyzer"
  },
  filetypes = {
    "glsl"
  },
  root_markers = {
    ".git",
    "justfile"
  },

  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
}
