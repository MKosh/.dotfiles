return {
  {
    "folke/noice.nvim",
    -- event = "VeryLazy",
    opts = {
      -- add any options here
      -- lsp = {
      --   -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      --   override = {
      --     ["$/progress"] = true,
      --     ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      --     ["vim.lsp.util.stylize_markdown"] = true,
      --     ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      --   },
      -- },
      -- lsp = { progress = { enabled = true }},
      -- routes = {
      --   {
      --     filter = {
      --       event = "lsp",
      --       kind = "progress",
      --       find = "jdtls",
      --     },
      --     opts = {skip = true},
      --   }
      -- },
      presets = {
        command_palette = true,
        lsp_doc_border = false,
        long_message_to_split = true,
      },
      messages = { enabled = true },
      commands = {
        last = {
          view = "split",
        },
        history = {
          view = "split",
        },
        errors = {
          view = "split",
        },
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
}
