return {
  {
    'echasnovski/mini.comment',
    opts = {

    },
  },


  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    opts = {
      languages = {
        cpp = {__default = "// %s", __multiline = '/* %s */'},
        glsl = "// %s",
      },
    },
  },

  -- {
  --   "rcarriga/nvim-dap-ui",
  --   dependencies = { "nvim-neotest/nvim-nio" },
  --   -- stylua: ignore
  --   keys = {
  --     { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
  --     { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
  --   },
  --   opts = {},
  --   config = function(_, opts)
  --     local dap = require("dap")
  --     local dapui = require("dapui")
  --     dapui.setup(opts)
  --     dap.listeners.after.event_initialized["dapui_config"] = function()
  --       dapui.open({})
  --     end
  --     dap.listeners.before.event_terminated["dapui_config"] = function()
  --       dapui.close({})
  --     end
  --     dap.listeners.before.event_exited["dapui_config"] = function()
  --       dapui.close({})
  --     end
  --   end,
  -- },

  {
    "mfussenegger/nvim-dap",
    config = function()
    local Config = require("lazyvim.config")
    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

    for name, sign in pairs(Config.icons.dap) do
      sign = type(sign) == "table" and sign or { sign }
      vim.fn.sign_define(
        "Dap" .. name,
        { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
      )
    end
    local dap = require('dap')

    dap.adapters.lldb = {
      type = 'executable',
      -- command = '/usr/bin/lldb-vscode',
      command = '/opt/local/bin/lldb-vscode-mp-15',
      name = 'lldb',
    }

    dap.adapters.cpptools = {
      type = 'executable',
      command = '/Users/mmekosh/.local/share/nvim/mason/bin/OpenDebugAD7',
      name = 'cpptools',
    }

    dap.adapters.codelldb = {
      type = 'server',
      port = "${port}",
      executable = {
        command = '/Users/mmekosh/.local/share/nvim/mason/bin/codelldb',
        args = {"--port", "${port}"},
      }
    }

    dap.configurations.cpp = {
      {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {
          'outfileroot=/Users/mmekosh/xrism/temp/rslrmf_crash/rsl_loc_rmfbm01_X_px0_Hp_big',
          'whichrmf=X',
          'pixel=0',
          'resol=Hp',
          'infile=NONE',
          'rmfparamfile=CALDB',
          'chatter=3',
          'clobber=yes',
          'debug=yes',
          'logfile=/Users/mmekosh/xrism/temp/rslrmf_crash/rsl_loc_rmfbm01_X_px0_Hp_big.log'
        },
      },
    }
    local env = function()
      local variables = {}
      for k, v in pairs(vim.fn.environ()) do
        table.insert(variables, string.format("%s=%s", k, v))
      end
      return variables
    end
  end,
  },


  {
    'stevearc/aerial.nvim',
    opts = {
      disable_max_lines = 30000,
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    }
  },
}
