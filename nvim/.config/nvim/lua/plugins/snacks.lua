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
      layout    = { enabled = true },
      images    = { enabled = true },
      picker = {
        enabled = true,
        layout = "ivy",
      },
      -- Toggle ----------------------------------------------------------------
      toggle    = {
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
      -- Toggle ----------------------------------------------------------------
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
      -- dashboard ----------------------------------------------------------------
    },
    keys = {
      { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
      { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
      { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
      { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Blame line" },
      -- { "<leader>uL", function() Snacks.toggle.option("relativenumber") end, desc = "Relative number" }
      -- { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
      -- { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
      -- { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
      -- { "<leader><space>", function() Snacks.picker.files() end, desc = "Find Files" },
      -- -- find
      -- { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      -- { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
      -- { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
      -- { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
      -- { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
      -- -- git
      -- { "<leader>gc", function() Snacks.picker.git_log() end, desc = "Git Log" },
      -- { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
      -- -- Grep
      -- { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      -- { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
      -- { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
      -- { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
      -- -- search
      -- { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
      -- { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
      -- { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
      -- { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
      -- { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
      -- { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
      -- { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
      -- { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
      -- { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      -- { "<leader>sl", function() Snacks.picker.loclist() end, desc = "Location List" },
      -- { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
      -- { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
      -- { "<leader>sR", function() Snacks.picker.resume() end, desc = "Resume" },
      -- { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
      -- { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
      -- { "<leader>qp", function() Snacks.picker.projects() end, desc = "Projects" },
      -- -- LSP
      -- { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
      -- { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
      -- { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
      -- { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
      -- { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    },
  },


}
