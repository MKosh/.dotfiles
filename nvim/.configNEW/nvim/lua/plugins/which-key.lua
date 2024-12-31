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
          { "<leader>f", group = "Fzf" },
          { "<leader>b", group = "Buffer" },
          { "<leader>c", group = "Code" },
          { "<leader>w", group = "Windows" },
          { "<leader>x", group = "Quickfix" },
          { "<leader>d", group = "Debug" },
          { "<leader>u", group = "UI" },
          { "<leader>r", group = "Run" },
        }
      },
    },
  },
}