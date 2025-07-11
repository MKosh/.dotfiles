return {

  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
	    -- local statusline = require('mini.statusline').setup({
	    --    use_icons = true
	    --  })
	    local files = require('mini.files').setup({})
	    local icons = require('mini.icons').setup({})
      local ai    = require('mini.ai').setup({})
      local pairs = require('mini.pairs').setup({})
      local git   = require('mini.git').setup({})
      local cursorword = require('mini.cursorword').setup({})
      local extra = require('mini.extra').setup({})
      -- local pick  = require('mini.pick').setup({
      --   window = {
      --     config = {
      --       border = "single",
      --     },
      --   },
      -- })
      local surround = require('mini.surround').setup({
        mappings = {
          add = "gsa", -- Add surrounding in Normal and Visual modes
          delete = "gsd", -- Delete surrounding
          find = "gsf", -- Find surrounding (to the right)
          find_left = "gsF", -- Find surrounding (to the left)
          highlight = "gsh", -- Highlight surrounding
          replace = "gsr", -- Replace surrounding
          update_n_lines = "gsn", -- Update `n_lines`
        },
      })

      local indentscope = require('mini.indentscope').setup({
        symbol = '▏',
      })

      local diff  = require('mini.diff').setup({
        view = {
          style = 'sign',
          signs = { add = '▎', change = '▎', delete = '' }, -- ▒ ▏ 
        },
      })

      local notify = require('mini.notify').setup({})
    end
  },

}
