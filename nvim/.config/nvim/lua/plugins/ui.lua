return {
  {
    "ellisonleao/gruvbox.nvim",
    -- priority = 1000,
  },

  {
    "Mofiqul/vscode.nvim",
    -- priority = 1001,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      defaults = {
        ["<leader>h"] = { name = "+harpoon" },
        ["<leader>gh"] = { name = "+hunks"},
        ["<leader>m"] = { name = "+make"},
      },
      window = {
        border = "double",
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        separator_style = "slant",
        always_show_bufferline=true,
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        disabled_filetypes = {'alpha', "Neo-tree", 'toggleterm'},
      },
      sections = {
        lualine_z = {
            function()
              return " " .. os.date("%a %b %d %I:%M")
            end,
        }
      }
    },
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "LazyFile",
    opts = {
      indent = {
        -- char = "│▏",
        char = "▏",
        -- tab_char = "▏",
        -- tab_char = "│",
      },
      scope = { enabled = false },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
    main = "ibl",
  },

  -- Active indent guide and indent text objects. When you're browsing
  -- code, this highlights the current level of indentation, and animates
  -- the highlighting.
  {
    "echasnovski/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "LazyFile",
    opts = {
      symbol = "▏",
      -- symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  -- {
  --   "stevearc/oil.nvim",
  --   opts = {
  --     float = {
  --       padding = 2,
  --       border = "rounded",
  --       max_width = 0,
  --       max_height = 0,
  --       -- win_options = {
  --       --   winblend = 0,
  --       -- },
  --     },
  --   },
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  --   },
  -- },
  {
    'echasnovski/mini.files',
    version = false,
    opts = {},
  },

  {
    "hrsh7th/nvim-cmp",
    opts = {
      window = {
        completion = require("cmp").config.window.bordered(),
        documentation = require("cmp").config.window.bordered(),
      },
    },
  },

  {
    "L3MON4D3/LuaSnip",
    keys = {
      {
        "<tab>",
        function()
          return require('luasnip').locally_jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true, silent = true, mode = "i",
      },
      { "<tab>", function() require('luasnip').jump(1) end, mode = "s" },
      { "<s-tab>", function() require('luasnip').jump(-1) end, mode = {"i", "s"} },
    },
  }
}
