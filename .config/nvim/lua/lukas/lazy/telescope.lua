return {
  'nvim-telescope/telescope.nvim',

  branch = '0.1.x',

  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep'
  },

  config = function()
    require("telescope").setup({})

    local builtin = require('telescope.builtin')

    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, { desc = "Telescope: " .. desc })
    end

    map('<leader>pf', builtin.find_files, "Find files")
    map('<C-p>', builtin.git_files, "Find in git files")
    map('<leader>fk', builtin.keymaps, "[F]ind [k]eymaps")
    map('<leader>fd', builtin.diagnostics, "[F]ind workspace [d]iagnostics")

    map('<leader>ps', builtin.live_grep, "Grep in current project directory")

    map('<leader>fw', function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end, "[F]ind current [w]ord")

    map('<leader>fW', function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end, "[F]ind current [W]ORD")

    map('<leader>fh', builtin.help_tags, "[F]ind [h]elp-tags")
    map('<leader>fq', builtin.quickfix, "[F]ind [q]uickfix")
  end
}
