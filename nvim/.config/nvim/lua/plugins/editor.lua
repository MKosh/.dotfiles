return {

  { "folke/flash.nvim",
    enabled = false
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
  },
  --   keys = function()
  --     local keys = {
  --       {
  --         "<leader>H",
  --         function()
  --           require("harpoon"):list():add()
  --         end,
  --         desc = "Harpoon File",
  --       },
  --       {
  --         "<leader>h",
  --         function()
  --           local harpoon = require("harpoon")
  --           harpoon.ui:toggle_quick_menu(harpoon:list())
  --         end,
  --         desc = "Harpoon Quick Menu",
  --       },
  --     }
  --
  --     -- for i = 1, 5 do
  --     --   table.insert(keys, {
  --     --     "<leader>" .. i,
  --     --     function()
  --     --       require("harpoon"):list():select(i)
  --     --     end,
  --     --     desc = "Harpoon to File " .. i,
  --     --   })
  --     -- end
  --     return keys
  --   end,
  -- },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   event = "LazyFile",
  --   opts = {
  --     indent = {
  --       -- char = "│▏",
  --       char = "▏",
  --       -- tab_char = "▏",
  --       -- tab_char = "│",
  --     },
  --     scope = { enabled = false },
  --     exclude = {
  --       filetypes = {
  --         "help",
  --         "alpha",
  --         "dashboard",
  --         "neo-tree",
  --         "Trouble",
  --         "lazy",
  --         "mason",
  --         "notify",
  --         "toggleterm",
  --         "lazyterm",
  --       },
  --     },
  --   },
  --   main = "ibl",
  -- },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      latex = {
        enabled = true,
        converter = 'latex2text',
        highlight = 'RenderMarkdownMath',
        top_pad = 0,
        bottom_pad = 0,
      },
    },
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  }

}
