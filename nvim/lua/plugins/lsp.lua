return {
  {
    "tikhomirov/vim-glsl"
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     require('lspconfig').glsl_analyzer.setup{}
  --   },
  -- },

  -- "neovim/nvim-lspconfig",
  -- opts = {
  --   inlay_hints = {
  --     enabled = true,
  --   },
  -- },
  -- keys = {
  --   vim.keymap.set('n', '<leader>ch', function() vim.lsp.inlay_hint(bufnr, nil) end, { silent = true, desc = "Toggle inlay hints" })
  -- }
-- local methods = vim.lsp.protocol.Methods
-- if (client.supports_method(methods.textDocument_inlayHint)) then
--   vim.keymap.set('n', '<leader>ch', function() vim.lsp.inlay_hint(bufnr, nil) end, { silent = true, desc = "Toggle inlay hints" })
-- end
}
