return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        inlay_hints = { enabled = true },
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    config = function()
      require('lspconfig').lua_ls.setup({})
      require('lspconfig').clangd.setup({})
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          local buffer = args.buf
          -- if client.supports_method("textDocument/implementation") then
          --   -- Create a keymap for vim.lsp.buf.implementation
          -- end

          -- if client.supports_method('textDocument/formatting') then
          --   vim.api.nvim_create_autocmd('BufWritePre', {
          --     callback = function()
          --       vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
          --     end,
          --   })
          -- end

          if client.supports_method('textDocument/inlay_hints') then
            -- vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
            vim.lsp.inlay_hint.enable(true)
          end
        end,
      })
    end,
  }
}
