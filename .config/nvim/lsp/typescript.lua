return {
  cmd = {
    "typescript-language-server", "--stdio",
  },
  filetypes = {
    "typescript",
    "javascript"
  },
  root_markers = {
    ".git"
  },
  -- settings = {
  --     Lua = {
  --         diagnostics = {
  --             --     disable = { "missing-parameters", "missing-fields" },
  --         },
  --     },
  -- },

  single_file_support = true,
  log_level = vim.lsp.protocol.MessageType.Warning,
}
