return {
  'SirVer/ultisnips',
  dependencies = {
    'honza/vim-snippets'
  },
  init = function()
    -- Plugin 'honza/vim-snippets'
    vim.g.UltiSnipsExpandTrigger = "<tab>"
    vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
    vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"

    vim.opt.conceallevel = 1

    -- vim.g.UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = "~/.vim/UltiSnips"
  end
}
