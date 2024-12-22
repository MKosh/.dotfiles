return {

  -- Set up catppuccin colorscheme. Set it in lazy.lua (vim.cmd.colorscheme "catppuccin-macchiato")
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 100,
    config = function()
      require('catppuccin').setup()
    end
  },

}
