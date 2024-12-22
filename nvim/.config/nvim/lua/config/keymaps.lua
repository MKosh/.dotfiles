local set = vim.keymap.set
set('n', '-', function() if not require('mini.files').close() then require('mini.files').open() end end, { desc = "Open Mini.Files"})
set('n', '<leader>qq', ":q<CR>", { desc = "Quit" })
set('n', '<leader>qw', ":wq<CR>", { desc = "Save and Quit" })

set('n', '<esc>', ":nohl<CR>", { silent = true, desc = "No Highlight"})

-- -----------------------------------------------------------------------------
-- Buffers
set('n', '<leader>bw', ":w<CR>", { desc = "Write Buf" })
set("n", "<leader>bn", ":bnext<cr>",          { silent = true, desc = "Next" })
set("n", "<leader>bb", ":bprevious<cr>",      { silent = true, desc = "Back" })
set("n", "<leader>bc", ":bd<cr>",             { silent = true, desc = "Close buffer" })
set("n", "<leader>bj", ":BufferLinePick<cr>", { silent = true, desc = "Jump to" })

-- ---------------------------------------------------------------------------------------------------------------------
-- Window size
set('n', '<M-Down>',   '<C-w>-',               { silent = true, desc = 'Decrease window height'})
set('n', '<M-Up>',     '<C-w>+',               { silent = true, desc = 'Increase window height'})
set('n', '<M-Left>',   '<C-w><',               { silent = true, desc = 'Decrease window width'})
set('n', '<M-Right>',  '<C-w>>',               { silent = true, desc = 'Increase window width'})

-- ------------------------------------------------------------------------------------------------------
-- fzf-lua
set('n', '<leader>ff', function() require('fzf-lua').files() end, { desc = "Files" })
set('n', '<leader>fb', function() require('fzf-lua').buffers() end, { desc = "Buffers" })
set('n', '<leader>fm', function() require('fzf-lua').marks() end, { desc = "Marks" })
set('n', '<leader>fC', function() require('fzf-lua').colorschemes() end, { desc = "Colorschemes" })
set('n', '<leader>fj', function() require('fzf-lua').jumps() end, { desc = "Jumps" })
set('n', '<leader>fr', function() require('fzf-lua').registers() end, { desc = "Registers" })
set('n', '<leader>fp', function() require('fzf-lua').profiles() end, { desc = "Profiles" })
set('n', '<leader>fg', function() require('fzf-lua').live_grep() end, { desc = "Grep" })
set('n', '<leader>fo', function() require('fzf-lua').oldfiles() end, { desc = "Oldfiles" })
set('n', '<leader>fq', function() require('fzf-lua').quickfix() end, { desc = "Quickfix" })
set('n', '<leader>fc', function() require('fzf-lua').command_history() end, { desc = "Command hist" })
