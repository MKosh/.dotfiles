return {

  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
	    local statusline = require('mini.statusline').setup({
        use_icons = true
      })
	    local files = require('mini.files').setup({})
	    local icons = require('mini.icons').setup({})
      local ai    = require('mini.ai').setup({})
      local pairs = require('mini.pairs').setup({})
      local git   = require('mini.git').setup({})
      local diff  = require('mini.diff').setup({
        view = {
          style = 'sign',
          signs = { add = '▒', change = '▒', delete = '▒' },
        },
      })
    end
  },

}
