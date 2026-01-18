return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        inlay_hints = { enabled = false },
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          { path = "lazy.nvim", words = { "LazyVim" } },
          { path = "snacks.nvim", words = {"Snacks"} },
        },
      },
    },
    config = function()
      -- vim.lsp.set_log_level("off");
      -- require('lspconfig').lua_ls.setup({ })
      -- require('lspconfig').fortls.setup({})
      -- require('lspconfig').perlnavigator.setup({ cmd = { 'perlnavigator' } })
      -- require('lspconfig').cmake.setup({})
      -- require('lspconfig').zls.setup({})
      -- require('lspconfig').texlab.setup({})
      -- require('lspconfig').jdtls.setup({
      -- require('lspconfig').clangd.setup({
      vim.lsp.config('*', {
        root_markers = { '.git' },
      })
      vim.lsp.config.clangd = {
        root_dir = vim.fs.root(vim.fn.getcwd(), ".git"),
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        },
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
        },
      }
      vim.lsp.config.perlnavigator = {
        cmd = { 'perlnavigator' }
      }
      vim.lsp.config["asm-lsp"] = {
        cmd = { 'asm-lsp' }
      }
      vim.lsp.enable({"clangd", "jdtls", "lua_ls", "fortls", "cmake", "texlab", "perlnavigator", "zls"})

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
          --       callback = function()
          --           vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
          --       end,
          --   })
          -- end

          -- Keep hints disabled by default
          -- if vim.lsp.client.supports_method(client, 'textDocument/inlay_hints') then
          --   vim.lsp.inlay_hint.enable(true)
          -- end

          local navic = require('nvim-navic')
          navic.attach(client, buffer)
          vim.diagnostic.config({
            signs = {
              text = {
                [vim.diagnostic.severity.ERROR] = '',
                [vim.diagnostic.severity.WARN] = '',
                [vim.diagnostic.severity.HINT] = '',
                [vim.diagnostic.severity.INFO] = ''
              },
              -- linehl = { },
              numhl = {
                [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
                [vim.diagnostic.severity.WARN] = 'WarningMsg',
              },
            },
          })
          end,
        })
      end,
    },


  {
    "p00f/clangd_extensions.nvim",
    config = function() end,
    opts = {
      inlay_hints = {
        inline = false,
      },
      ast = {
        --These require codicons (https://github.com/microsoft/vscode-codicons)
        role_icons = {
          type = "",
          declaration = "",
          expression = "",
          specifier = "",
          statement = "",
          ["template argument"] = "",
        },
        kind_icons = {
          Compound = "",
          Recovery = "",
          TranslationUnit = "",
          PackExpansion = "",
          TemplateTypeParm = "",
          TemplateTemplateParm = "",
          TemplateParamObject = "",
        },
      },
    },
  }
}
