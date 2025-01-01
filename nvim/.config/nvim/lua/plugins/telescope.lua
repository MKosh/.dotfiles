-- return {}
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    opts = {
      defaults = {
        initial_mode = 'normal',
        -- mappings = {
        --   n = {
        --     ['dd'] = require('telescope.actions').delete_buffer
        --   },
        -- }
        -- layout_strategy = "horizontal",
        -- layout_config = { prompt_position = "top" },
        -- sorting_strategy = "ascending",
        -- winblend = 0,
      },
      pickers = {
        find_files = {
          theme = "ivy"
        },
        git_files = {
          theme = "ivy",
        },
        live_grep = {
          theme = "ivy"
        },
        buffers = {
          theme = "ivy",
        },
        oldfiles = {
          theme = "ivy",
        },
        command_history = {
        },
        colorscheme = {
          enable_preview = true,
        },
        lsp_references = {
          theme = "ivy"
        },
        lsp_document_symbols = {
          theme = "ivy"
        },
      }
    },
  }
}
