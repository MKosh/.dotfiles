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
    -- keys = {
    --   {"gd", "<cmd>FzfLua lsp_definitions jump_to_single_result=true ignore_current_line=true<cr>", desc = "Go to definition"},
    -- },


    -- servers = {
    --   -- Ensure mason installs the server
    --   clangd = {
    --     mason = false,
    --     keys = {
    --       { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
    --     },
    --     root_dir = function(fname)
    --       return require("lspconfig.util").root_pattern(
    --         -- "Makefile",
    --         "configure.ac",
    --         "configure.in",
    --         "config.h.in",
    --         "meson.build",
    --         "meson_options.txt",
    --         "build.ninja"
    --       )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
    --         fname
    --       ) or vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true})[1])
    --     end,
    --     capabilities = {
    --       offsetEncoding = { "utf-16" },
    --     },
    --     cmd = {
    --       "clangd",
    --       "--background-index",
    --       "--clang-tidy",
    --       "--header-insertion=iwyu",
    --       "--completion-style=detailed",
    --       "--function-arg-placeholders",
    --       "--fallback-style=llvm",
    --     },
    --     init_options = {
    --       usePlaceholders = true,
    --       completeUnimported = true,
    --       clangdFileStatus = true,
    --     },
    --   },
    -- },
  }
}
