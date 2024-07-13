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

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
    -- stylua: ignore
    keys = {
      { "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
      { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
    },
    opts = {},
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup(opts)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
    end,
  },

  -- {
  --   "theHamsta/nvim-dap-virtual-text",
  --   opts={},
  -- },

  {
    "mfussenegger/nvim-dap",

    keys = {
      { "<leader>d", "", desc = "+debug", mode = {"n", "v"} },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
      { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
      { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
      { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
      { "<leader>dj", function() require("dap").down() end, desc = "Down" },
      { "<leader>dk", function() require("dap").up() end, desc = "Up" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
      { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>ds", function() require("dap").session() end, desc = "Session" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
    },

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
        command = 'codelldb',
        -- command = '/Users/mmekosh/.local/share/nvim/mason/bin/codelldb',
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
            'infile=/Users/mmekosh/xrism/data/sequences/100009140/resolve/event_uf/xa100009140rsl_p0px1000_uf.evt.gz',
            'outfile=/Users/mmekosh/xrism/docs/resources/rslseccor/b8_mods/test_out/100009140/Build8_debug_out.evt',
            'clobber=yes',
            'chatter=3',
            'logfile=/Users/mmekosh/xrism/docs/resources/rslseccor/b8_mods/test_out/100009140/Build8_debug_log.log',
          -- 'outfileroot=/Users/mmekosh/xrism/temp/rslrmf_crash/rsl_loc_rmfbm01_X_px0_Hp_big',
          -- 'whichrmf=X',
          -- 'pixel=0',
          -- 'resol=Hp',
          -- 'infile=NONE',
          -- 'rmfparamfile=CALDB',
          -- 'chatter=3',
          -- 'clobber=yes',
          -- 'debug=yes',
          -- 'logfile=/Users/mmekosh/xrism/temp/rslrmf_crash/rsl_loc_rmfbm01_X_px0_Hp_big.log'
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
