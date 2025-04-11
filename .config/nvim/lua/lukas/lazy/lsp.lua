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

    -- To instead override globally
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or "rounded"
      return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end

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


    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("Lukas", { clear = true }),
      callback = function(event)
        -- NOTE: Remember that Lua is a real programming language, and as such it is possible
        -- to define small helper and utility functions so you don't have to repeat yourself.
        --
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)

        map("[d", vim.diagnostic.goto_next, "Goto next diagnostic")
        map("]d", vim.diagnostic.goto_prev, "Goto prev diagnostic")


        local telescope = require('telescope.builtin')

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-t>.
        map("gd", telescope.lsp_definitions, "[G]oto [D]efinition")

        -- Find references for the word under your cursor.
        map("gr", telescope.lsp_references, "[G]oto [R]eferences")

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map("gI", telescope.lsp_implementations, "[G]oto [I]mplementation")

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        map("<leader>D", telescope.lsp_type_definitions, "Type [D]efinition")

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        map("<leader>ds", telescope.lsp_document_symbols, "[D]ocument [S]ymbols")

        -- Fuzzy find all the symbols in your current workspace.
        --  Similar to document symbols, except searches over your entire project.
        map("<leader>ws", telescope.lsp_workspace_symbols, "[W]orkspace [S]ymbols")

        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        map("<leader>ra", vim.lsp.buf.rename, "[R]en[a]me")

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        -- Open floating diagnostics
        map("<leader>fl", vim.diagnostic.open_float, "Open [fl]oating diagnostics")

        -- Format current buffer with formatter
        map("<leader>fm", vim.lsp.buf.format, "[F]or[m]at current buffer")
      end,
    })
  end
}
