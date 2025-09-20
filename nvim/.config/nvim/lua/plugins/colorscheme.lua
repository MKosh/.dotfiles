return {

  -- Set up catppuccin colorscheme. Set it in lazy.lua (vim.cmd.colorscheme "catppuccin-macchiato")
  -- {
  --   "catppuccin/nvim",
  --   lazy = false,
  --   name = "catppuccin",
  --   priority = 100,
  --   config = function()
  --     require('catppuccin').setup()
  --   end
  -- },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },

  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    config = function()
      require('nordic').load()
      -- require('nordic').setup({
      --   reduced_blue = false,
      --   bright_border = true,
      -- })

    end
  },

  {
    "sainnhe/everforest",
    lazy = false,
  },

  {
    "sainnhe/gruvbox-material",
  },

  {
    "sainnhe/edge",
  },

  {
    "sainnhe/sonokai",
  },

  {
    "Mofiqul/vscode.nvim",
  },

  {
    "folke/tokyonight.nvim",
  },

  {
    "EdenEast/nightfox.nvim",
  },

  {
    "nordtheme/vim",
  },

}
