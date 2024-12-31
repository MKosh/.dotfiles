return {

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      scratch   = { enabled = true },
      notifier  = { enabled = true },
      terminal  = { enabled = true },
      bufdelete = { enabled = true },
      -- statuscolumn = { enabled = true },
      -- words = { enabled = true },
      -- toggle = { enabled = true },
      -- toggle    = {
      --   opts = {
      --     map = vim.keymap.set,
      --     which_key = true,
      --     notify = true,
      --     icon = {
      --       enabled = " ",
      --       disabled = " ",
      --     },
      --     -- colors for enabled/disabled states
      --     color = {
      --       enabled = "green",
      --       disabled = "yellow",
      --     },
      --   },
      -- },
      -- terminal = { enabled = true,
      --   win = { position = "float" },
      -- },
      dashboard = {

        sections = {
          { section = "header" },
          {
            pane = 2,
          --   section = "terminal",
          --   cmd = "colorscript -e square",
            height = 5,
            padding = 8,
          },
          { section = "keys", gap = 1, padding = 1 },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          { section = "startup" },
        },

        -- sections = {
        --   { section = "header" },
        --   { section = "keys", gap = 1 },
        --   { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = { 2, 2 } },
        --   { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
        --   { section = "startup" },
        -- },
      },
    },
    keys = {
      { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
      { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
      { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
      -- { "<leader>uh", function() Snacks.toggle.inlay_hints() end, desc = "Inlay hints" },
      -- { "<leader>uL", function() Snacks.toggle.option("relativenumber") end, desc = "Relative number" }
    },
  },


}
