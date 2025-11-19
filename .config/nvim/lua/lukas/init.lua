require("lukas.set")
require("lukas.keymaps")
require("lukas.lazy-init")
require("lukas.lsp")

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.opt_local.makeprg = "python3 %:S"
    end,
})
