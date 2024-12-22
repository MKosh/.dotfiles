return {
	{
		"folke/which-key.nvim",
    lazy = false,
    opts_extend = { "spec" },
    opts = {
      win = {
        border = "double",
      },
      spec = {
        {
          mode = { "n", "v" },
          { "<leader>q", group = "Quit" },
          { "<leader>f", group = "Fzf" },
          { "<leader>b", group = "Buffer" },
        }
      },
    },
	},
}
