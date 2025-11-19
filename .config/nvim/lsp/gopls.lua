return {
  cmd = {
    "gopls",
  },
  filetypes = {
    "go",
  },
  root_markers = {
    ".git",
    "go.mod",
    "go.work",
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
