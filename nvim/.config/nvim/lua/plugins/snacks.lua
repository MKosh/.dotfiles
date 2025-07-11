return {

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      scratch   = { enabled = true  },
      notifier  = { enabled = true  },
      terminal  = { enabled = false },
      bufdelete = { enabled = true  },
      layout    = { enabled = false },
      images    = { enabled = true  },

      -- Indent ----------------------------------------------------------------
      indent = {
        enabled = false,
        indent = {
          enabled = true,
          char = "▏",
          only_scope = false,
          only_current = false,
          hl = "CocExplorerIndentLine",
        },
        scope = {
          enabled = false,
          char = "▏",
          only_current = false,
          hl = "Comment",
        },
        chunk = {
          enabled = false,
          only_current = true,
          hl = "IndentBlanklineContextChar",
        }
      },

      -- Picker ----------------------------------------------------------------
      picker = {
        enabled = true,
        layout = "ivy",
      },

      -- Toggle ----------------------------------------------------------------
      toggle = {
        enabled = true,
        map = vim.keymap.set, -- keymap.set function to use
        which_key = true, -- integrate with which-key to show enabled/disabled icons and colors
        notify = true, -- show a notification when toggling
        -- icons for enabled/disabled states
        icon = {
          enabled = " ",
          disabled = " ",
        },
        -- colors for enabled/disabled states
        color = {
          enabled = "green",
          disabled = "yellow",
        },
      },

      -- dashboard ----------------------------------------------------------------
      dashboard = {
        sections = {
          { section = "header" },
          {
            pane = 2,
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
      },
    },

    keys = {
      { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
      { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
      { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
      { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Blame line" },
    },
  },


}
