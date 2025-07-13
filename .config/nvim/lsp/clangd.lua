return {
  cmd = {
    "clangd", "--clang-tidy"
  },
  filetypes = {
    "c", "cpp",
  },
  root_markers = {
    ".git",
    "justfile"
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
