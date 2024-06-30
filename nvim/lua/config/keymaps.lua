-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- -----------------------------------------------------------------------------
-- Buffers
vim.keymap.set("n", "<leader>bn", ":bnext<cr>",          { silent = true, desc = "Next" })
vim.keymap.set("n", "<leader>bb", ":bprevious<cr>",      { silent = true, desc = "Back" })
vim.keymap.set("n", "<leader>bc", ":bd<cr>",             { silent = true, desc = "Close buffer" })
vim.keymap.set("n", "<leader>bj", ":BufferLinePick<cr>", { silent = true, desc = "Jump to" })
vim.keymap.set("n", "<leader>bs", ":w<CR>",              { silent = true, desc = "Save buffer"})

-- ---------------------------------------------------------------------------------------------------------------------
-- Window size
vim.keymap.set('n', '<M-Down>',   '<C-w>-',               { silent = true, desc = 'Decrease window height'})
vim.keymap.set('n', '<M-Up>',     '<C-w>+',               { silent = true, desc = 'Increase window height'})
vim.keymap.set('n', '<M-Left>',   '<C-w><',               { silent = true, desc = 'Decrease window width'})
vim.keymap.set('n', '<M-Right>',  '<C-w>>',               { silent = true, desc = 'Increase window width'})

-- -----------------------------------------------------------------------------
-- ToggleTerm
vim.keymap.set("n", "<M-1>", ":ToggleTerm size=10 direction=horizontal<CR>", { silent = true, desc = "Open horizontal terminal"})
vim.keymap.set("n", "<M-2>", ":ToggleTerm size=120 direction=vertical<CR>",   { silent = true, desc = "Open vertical terminal"})
vim.keymap.set("n", "<M-3>", ":ToggleTerm size=30 direction=float<CR>",      { silent = true, desc = "Open floating terminal"})
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]],            { silent = true, desc = 'Exit terminal'})
vim.keymap.set('t', 'jk',    [[<C-\><C-n>]],            { silent = true, desc = 'Exit terminal'})
vim.keymap.set('t', '<C-j>', [[<cmd>wincmd j<CR>]],     { silent = true, desc = 'Move window down'})
vim.keymap.set('t', '<C-h>', [[<cmd>wincmd h<CR>]],     { silent = true, desc = 'Move window left'})
vim.keymap.set('t', '<C-k>', [[<cmd>wincmd k<CR>]],     { silent = true, desc = 'Move window up'})
vim.keymap.set('t', '<C-l>', [[<cmd>wincmd l<CR>]],     { silent = true, desc = 'Move window right'})
vim.keymap.set('t', '<M-1>', [[<cmd>ToggleTerm<cr>]],   { silent = true, desc = 'Open horizontal terminal'})
vim.keymap.set('t', '<M-2>', [[<cmd>ToggleTerm<cr>]],   { silent = true, desc = 'Open vertical terminal'})
vim.keymap.set('t', '<M-3>', [[<cmd>ToggleTerm<cr>]],   { silent = true, desc = 'Open floating terminal'})

vim.keymap.set('n', 'dm', ':delmarks ', {desc = "Delete marks"})

-- -----------------------------------------------------------------------------
-- Telescope
vim.keymap.set('n', '<leader>s/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({winblend=10,previewer=false,})) end, { silent = true, desc = "Fuzzy find in current buffer"} )

-- -----------------------------------------------------------------------------
-- Editing keymaps
vim.keymap.set('n', '<leader>cp', '$a # +++ MMM<esc>',         { desc = "Perl my EOL comment"})
vim.keymap.set('n', '<leader>cc', '$a // +++ MMM<esc>',        { desc = "C++ my EOL comment"})

-- -----------------------------------------------------------------------------
-- General keymaps
vim.keymap.set('n', '<leader>;', ':Dashboard<cr>',            { silent = true, desc = 'Dashboard'})

-- -----------------------------------------------------------------------------
-- Hmake
vim.keymap.set('n', '<leader>ma', ':! hmake all<cr>',            { silent = true, desc = 'hmake all'})
vim.keymap.set('n', '<leader>mi', ':! hmake install<cr>',        { silent = true, desc = 'hmake install'})
vim.keymap.set('n', '<leader>mh', ':silent :! hmake all && hmake install<cr>', { silent = true, desc = 'hmake all & install (silent)'})
vim.keymap.set('n', '<leader>ml', ':! hmake all && hmake install<cr>',         { silent = true, desc = 'hmake all & install (loud)'})

-- -----------------------------------------------------------------------------
-- Dap
vim.keymap.set('n', '<C-n>', function() require('dap').step_over() end, { silent = true, desc = 'Dap - step over' })
vim.keymap.set('n', '<C-s>', function() require('dap').step_into() end, { silent = true, desc = 'Dap - step into' })
vim.keymap.set('n', '<C-o>', function() require('dap').step_out() end,  { silent = true, desc = 'Dap - step out' })
vim.keymap.set('n', '<C-c>', function() require('dap').continue() end,  { silent = true, desc = 'Dap - continue' })
vim.keymap.set('n', '<leader>dm', function() require('dap').list_breakpoints(true) end, { silent = true, desc = 'List breakpoints'})

-- -----------------------------------------------------------------------------
-- Oil
-- vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory'})
-- vim.keymap.set('n',vim.keymap.set("n", --[[ your key combo --]], function()
-- vim.cmd("vsplit | wincmd l")
--   require("oil").open()
-- end) '<leader>of', "<CMD>lua require('oil').toggle_float('.')<CR>", { desc = 'Open Oil floating'})

-- -----------------------------------------------------------------------------
-- Mini.Files
vim.keymap.set('n', '-', function() if not require('mini.files').close() then require('mini.files').open() end end, { desc = "Open Mini.Files"})

require('lspconfig').glsl_analyzer.setup{}

require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ['d'] = require('telescope.actions').delete_buffer
      },
      i = {
        ['<C-d>'] = require('telescope.actions').delete_buffer
      }
    }
  }
}
-- vim.keymap.set('n', '<leader>dm', function() require('nvim-dap-projects').search_project_config() end, {silent = true, desc = 'Search config'})

-- vim.keymap.set('n', '<leader>d/', require('telescope').extensions.dap.list_breakpoints{}, {silent = true, desc = 'List breakpoints'})
-- vim.keymap.set('n', '<leader>df', require('telescope').extensions.dap.frames{},           {silent = true, desc = 'frames'})
-- vim.keymap.set('n', '<leader>d/', ':Telescope dap list_breakpoints<CR>', {silent = true, desc = 'List breakpoints'})
-- vim.keymap.set('n', '<leader>df', ':Telescope dap frames<CR>',           {silent = true, desc = 'frames'})
