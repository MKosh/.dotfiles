return {
  {
    "folke/which-key.nvim",
    lazy = false,
    opts_extend = { "spec" },
    opts = {
      preset = "modern",
      win = {
        border = "single",
      },
      spec = {
        {
          mode = { "n", "v" },
          { "<leader>q", group = "Quit" },
          { "<leader>g", group = "Git" },
          { "<leader>f", group = "Files/Dirs" },
          { "<leader>b", group = "Buffer" },
          { "<leader>c", group = "Code" },
          { "<leader>w", group = "Windows" },
          { "<leader>x", group = "Quickfix" },
          { "<leader>d", group = "Debug" },
          { "<leader>s", group = "Search" },
          { "<leader>u", group = "UI" },
          { "<leader>r", group = "Run" },
        }
      },
    },
  },
}
