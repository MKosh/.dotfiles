-- return {}
local lsp = require("lspconfig.util")
local harpoon = require("harpoon")
harpoon:setup()

local conf = require("telescope.config").values

local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers").new({}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table({
      results = file_paths,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end

-- vim.keymap.set("n", "<leader>fh", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = "telescope.nvim",
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    keys = function()
      local keys = {
        {
          "<leader>H",
          function()
            -- harpoon:list():add({vim.api.nvim_buf_get_name(0)})
            -- local root_dir = lsp.root_pattern('.git', 'compile_commands.json')(fname) or vim.fn.getcwd()
            local cwd = vim.fn.getcwd()
            local root_dir = lsp.find_git_ancestor(cwd) or vim.fn.getcwd()
            -- print("root: " .. root_dir .. "\ncwd: " .. cwd)
            if (root_dir == cwd) then
              harpoon:list():add()
            else
              vim.fn.chdir(root_dir)
              harpoon:list():add()
              vim.fn.chdir(cwd)
            end
          end,
          desc = "Harpoon File",
        },
        {
          "<leader>h",
          function()
            -- local harpoon = require("harpoon")
            local cwd = vim.fn.getcwd()
            local root_dir = lsp.find_git_ancestor(cwd) or vim.fn.getcwd()
            -- print("root: " .. root_dir .. "\ncwd: " .. cwd)
            if (root_dir == cwd) then
              harpoon.ui:toggle_quick_menu(harpoon:list())
            else
              vim.fn.chdir(root_dir)
              harpoon.ui:toggle_quick_menu(harpoon:list())
              vim.fn.chdir(cwd)
            end
          end,
          desc = "Harpoon Quick Menu",
        },
        {
          "<leader>fh",
          function()
            local cwd = vim.fn.getcwd()
            local root_dir = lsp.find_git_ancestor(cwd) or vim.fn.getcwd()
            -- print("root: " .. root_dir .. "\ncwd: " .. cwd)
            if (root_dir == cwd) then
              toggle_telescope(harpoon:list())
            else
              vim.fn.chdir(root_dir)
              toggle_telescope(harpoon:list())
              vim.fn.chdir(cwd)
            end
          end,
          desc = "Open harpoon list"
        },
      }

      -- for i = 1, 5 do
      --   table.insert(keys, {
      --     "<leader>" .. i,
      --     function()
      --       require("harpoon"):list():select(i)
      --     end,
      --     -- desc = "Harpoon to File " .. i,
      --     desc = nil,
      --   })
      -- end
      return keys
    end,
  }
