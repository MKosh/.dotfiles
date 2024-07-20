return {
    "ellisonleao/gruvbox.nvim",

    "Mofiqul/vscode.nvim",

    "sainnhe/gruvbox-material",

    "sainnhe/edge",

    "sainnhe/sonokai",

    "catppuccin/nvim",

  {
    "folke/tokyonight.nvim",
    lazy = false,
  },

  {
    "LazyVim/LazyVim",
    -- local latte = require("catppuccin.palettes").get_palettes "macchiato"
    opts = {
      colorscheme = "edge",
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        -- ["<leader>h"] = { group = "+harpoon" },
        -- ["<leader>gh"] = { group = "+hunks"},
        -- ["<leader>m"] = { group = "+make"},
      },
      win = {
        no_overlap = false,
        border = "double",
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    enabled = false,
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
        lualine_y = {
          {
            function()
              if (vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), 'modified')) then
                return ""
                -- return "⦿"▣
                -- return "◉"
              else
                return " "
              end
            end,
            separator = " ",
          },
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
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
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "LazyFile",
    opts = { mode = "cursor", max_lines = 6 },
    keys = {
      {
        "<leader>ut",
        function()
          local tsc = require("treesitter-context")
          tsc.toggle()
          if LazyVim.inject.get_upvalue(tsc.toggle, "enabled") then
            LazyVim.info("Enabled Treesitter Context", { title = "Option" })
          else
            LazyVim.warn("Disabled Treesitter Context", { title = "Option" })
          end
        end,
        desc = "Toggle Treesitter Context",
      },
    },
  }

}
