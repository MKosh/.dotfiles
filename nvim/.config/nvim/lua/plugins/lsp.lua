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

  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true, },
      servers = {
        -- Ensure mason installs the server
        clangd = {
          mason = false,
          keys = {
            { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
          },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              -- "Makefile",
              "configure.ac",
              "configure.in",
              "config.h.in",
              "meson.build",
              "meson_options.txt",
              "build.ninja"
            )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
              fname
            ) or require("lspconfig.util").find_git_ancestor(fname)
          end,
          capabilities = {
            offsetEncoding = { "utf-16" },
          },
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
        },
      },
      setup = {
        clangd = function(_, opts)
          local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
          require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
          return false
        end,
      },
    },
  },
  
  {
    "p00f/clangd_extensions.nvim",
    lazy = true,
    config = function() end,
    opts = {
      -- inlay_hints = {
      --   inline = false,
      -- },
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
  },
}
