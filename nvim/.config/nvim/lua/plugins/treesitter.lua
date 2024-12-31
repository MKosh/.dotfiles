return {

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    config = function()
      local treesitter = require('nvim-treesitter.configs')
      treesitter.setup({
        highlight = { enabled = true },
        indent = { enabled = true },
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "diff",
          "html",
          "javascript",
          "jsdoc",
          "json",
          "jsonc",
          "lua",
          "luadoc",
          "luap",
          "markdown",
          "markdown_inline",
          "printf",
          "python",
          "query",
          "regex",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "xml",
          "yaml",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },

      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    enabled = true,
    config = function()
      -- If treesitter is already loaded, we need to run config again for textobjects
      -- if LazyVim.is_loaded("nvim-treesitter") then
      --   local opts = LazyVim.opts("nvim-treesitter")
      --   require("nvim-treesitter.configs").setup({ textobjects = opts.textobjects })
      -- end

      -- require('nvim-treesitter.configs').setup({textobjects = opts.textobjects })
      -- When in diff mode, we want to use the default
      -- vim text objects c & C instead of the treesitter ones.
      local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
      local configs = require("nvim-treesitter.configs")
      for name, fn in pairs(move) do
        if name:find("goto") == 1 then
          move[name] = function(q, ...)
            if vim.wo.diff then
              local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
              for key, query in pairs(config or {}) do
                if q == query and key:find("[%]%[][cC]") then
                  vim.cmd("normal! " .. key)
                  return
                end
              end
            end
            return fn(q, ...)
          end
        end
      end
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    opts = { mode = "cursor", max_lines = 6 },
  },


}
