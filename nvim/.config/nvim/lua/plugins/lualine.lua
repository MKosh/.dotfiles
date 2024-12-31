return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        disabled_filetypes = {'alpha', "Neo-tree", 'toggleterm'},
        section_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = ''},
        component_separators = { left = '', right = ''},
      },
      sections = {
        lualine_a = { {'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_b = { 'branch' },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = " ",
              warn  = " ",
              hint  = " ",
              info  = " ",
            },
          },
          { function() return vim.fn.fnamemodify(vim.fs.dirname(vim.fs.find('.git', { upward = true })[1]), ":t") end },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", file_status = false },
        },

        lualine_x = {
          { "diff",
            symbols = {
              added    = " ",
              modified = " ",
              removed  = " ",
            }
          },
        },
        lualine_y = {
          {
            function()
              -- if (vim.api.nvim_buf_get_option(vim.api.nvim_get_current_buf(), 'modified')) then
              if (vim.api.nvim_get_option_value('modified', {})) then
                return ""
                -- return "⦿"▣
                -- return "◉"
              else
                return " "
              end
            end,
            separator = " ",
          },
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          {
            function()
              return " " .. os.date("%a %b %d %I:%M")
            end,
            separator = { right = '' },
            left_padding = 2,
          },
        },
      }
    },
  },
}
