return {
  cmd = {
    "svelteserver", "--stdio",
  },
  filetypes = {
    "svelte",
  },
  root_markers = {
    ".git", "tsconfig.json", "package.json"
  },
  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
}
