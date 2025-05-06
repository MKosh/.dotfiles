return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        globalstatus = true,
        disabled_filetypes = {'alpha', "Neo-tree", 'toggleterm'},
        section_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = ''},
        component_separators = { left = '', right = ''},
      },
      disabled_buftypes = {'dap-repl'},
      sections = {
        lualine_a = { {'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_b = { 'branch' },
        lualine_c = {
          {
            "diagnostics",
            -- separator = { left = '', right = ''},
            -- color = {bg='grey'},
            symbols = {
              error = " ",
              warn  = " ",
              hint  = " ",
              info  = " ",
            },
          },
          {
            function() -- Either show git directory or cwd
              local name = vim.fn.fnamemodify(vim.fs.dirname(vim.fs.find('.git', { upward = true })[1]), ":t")
              if name ~= 'v:null' then
                return name
              else
                return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
              end
            end },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", file_status = false },
          { "navic", separator = {left = '', right = ''}, color = 'lualine_a_command' },
        },

        lualine_x = {
          {
            function ()
              local reg = vim.fn.reg_recording()
              if reg == "" then return "" end -- not recording
              return "recording to " .. reg
            end,
          },
          { "diff",
            symbols = {
              added    = " ",
              modified = " ",
              removed  = " ",
            }
          },
          {
            function() return "  " .. require("dap").status() end,
            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
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
