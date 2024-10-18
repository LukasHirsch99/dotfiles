return {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_view_method = 'skim'
    vim.g.tex_flavor = 'latex'
    vim.g.vimtex_quickfix_mode = 0
    vim.g.conceallevel = 1
    vim.g.tex_conceal = 'abdmg'

    vim.g.vimtex_compiler_latexmk = {
      aux_dir = 'aux',
    }
  end
}
