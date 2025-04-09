return {
  "neovim/nvim-lspconfig",

  dependencies = {
    -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
    { "williamboman/mason.nvim", opts = {} },
    "williamboman/mason-lspconfig.nvim",
    -- "quangnguyen30192/cmp-nvim-ultisnips",

    -- Status updates for LSP
    "j-hui/fidget.nvim",
  },

  config = function()
    local original_capabilities = vim.lsp.protocol.make_client_capabilities()
    local capabilities = require('blink.cmp').get_lsp_capabilities(original_capabilities)

    require("fidget").setup({})
    require("mason").setup()


    -- Define custom settings for specific servers
    local servers = {
      lua_ls = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT'
        },
        workspace = {
          library = { vim.env.VIMRUNTIME },
        },
      }
    }

    require("mason-lspconfig").setup({
      ensure_installed = servers,

      handlers = {
        function(server_name) -- default handler (optional)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
      }
    })

    vim.diagnostic.config({
      -- update_in_insert = true,
      severity_sort = true,
      float = {
        border = "rounded",
        source = "always"
      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN] = "󰀪 ",
          [vim.diagnostic.severity.INFO] = "󰋽 ",
          [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
      },
    })
  end
}
