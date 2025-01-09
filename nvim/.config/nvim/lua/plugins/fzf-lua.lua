return {
  {
    "ibhagwan/fzf-lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local actions = require('fzf-lua').actions
      require("fzf-lua").setup({
        "telescope",
        defaults = {
          git_icons = false,
          file_icons = false,
        },
        buffers = {
          actions = {
            ["ctrl-x"] = { fn = actions.buf_del, reload = true },
          }
        }
      })
    end
  },
}
