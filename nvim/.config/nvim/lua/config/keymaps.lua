local set = vim.keymap.set

-- -----------------------------------------------------------------------------
-- General

set("n", "<space>rf", "<cmd>source %<CR>", { desc = "Run file"})
set("n", "<space>rl", ":.lua<CR>", { desc = "Run line" })
set("v", "<space>r", ":lua<CR>")
set('n', '<leader>qq', ":qa<CR>", { desc = "Quit all" })
set('n', '<leader>qw', ":wq<CR>", { desc = "Save and Quit" })
set({ "n", "i", "s" }, '<esc>', function()
  vim.cmd("noh")
  return "<esc>"
end, { silent = true, expr = true, desc = "No Highlight" })

-- -----------------------------------------------------------------------------
-- Mini
set('n', '-', function() if not require('mini.files').close() then require('mini.files').open() end end, { desc = "Open Mini.Files" })

-- -----------------------------------------------------------------------------
-- Buffers
set('n', '<leader>bs', ":w<CR>", { desc = "Save buffer" })
set("n", "<leader>bn", ":bnext<cr>", { silent = true, desc = "Next" })
set("n", "<leader>bb", ":bprevious<cr>", { silent = true, desc = "Back" })
set("n", "<leader>bc", ":bd<cr>", { silent = true, desc = "Close buffer" })
set("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete buffer" })
set("n", "<leader>bo", function() Snacks.bufdelete.other() end, { desc = "Delete other buffers" })
set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Prev Buffer" })
set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next Buffer" })

-- -----------------------------------------------------------------------------
-- Window Splits
set('n', "<leader>|", "<cmd>vsplit<CR>", { desc = "Vertical Split" })
set('n', "<leader>-", "<cmd>hsplit<CR>", { desc = "Horizontal Split" })

-- ---------------------------------------------------------------------------------------------------------------------
-- Window size
set('n', '<M-Down>', '<C-w>-', { silent = true, desc = 'Decrease window height' })
set('n', '<M-Up>', '<C-w>+', { silent = true, desc = 'Increase window height' })
set('n', '<M-Left>', '<C-w><', { silent = true, desc = 'Decrease window width' })
set('n', '<M-Right>', '<C-w>>', { silent = true, desc = 'Increase window width' })

-- -----------------------------------------------------------------------------
-- Window movement
set('n', '<C-j>', [[<cmd>wincmd j<CR>]], { silent = true, desc = 'Move window down' })
set('n', '<C-h>', [[<cmd>wincmd h<CR>]], { silent = true, desc = 'Move window left' })
set('n', '<C-k>', [[<cmd>wincmd k<CR>]], { silent = true, desc = 'Move window up' })
set('n', '<C-l>', [[<cmd>wincmd l<CR>]], { silent = true, desc = 'Move window right' })

-- -----------------------------------------------------------------------------
-- Terminal
-- set('n', '<M-1>', function() require("snacks").terminal.toggle() end, {})
-- set('t', '<M-1>', function() require("snacks").terminal.toggle() end, {})

-- -----------------------------------------------------------------------------
-- ToggleTerm
set("n", "<M-1>", ":ToggleTerm size=10 direction=horizontal<CR>", { silent = true, desc = "Open horizontal terminal"})
set("n", "<M-2>", ":ToggleTerm size=80 direction=vertical<CR>",   { silent = true, desc = "Open vertical terminal"})
set("n", "<M-3>", ":ToggleTerm size=30 direction=float<CR>",      { silent = true, desc = "Open floating terminal"})
set('t', '<esc>', [[<C-\><C-n>]],            { silent = true, desc = 'Exit terminal'})
set('t', 'jk',    [[<C-\><C-n>]],            { silent = true, desc = 'Exit terminal'})
set('t', '<M-1>', [[<cmd>ToggleTerm<cr>]],   { silent = true, desc = 'Open horizontal terminal'})
set('t', '<M-2>', [[<cmd>ToggleTerm<cr>]],   { silent = true, desc = 'Open vertical terminal'})
set('t', '<M-3>', [[<cmd>ToggleTerm<cr>]],   { silent = true, desc = 'Open floating terminal'})
set('t', '<C-j>', [[<cmd>wincmd j<CR>]], { silent = true, desc = 'Move window down' })
set('t', '<C-h>', [[<cmd>wincmd h<CR>]], { silent = true, desc = 'Move window left' })
set('t', '<C-k>', [[<cmd>wincmd k<CR>]], { silent = true, desc = 'Move window up' })
set('t', '<C-l>', [[<cmd>wincmd l<CR>]], { silent = true, desc = 'Move window right' })

-- -----------------------------------------------------------------------------
-- Telescope
if PICKER == "telescope" then
  local ts_builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>s/',
    function()
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({winblend=10,previewer=false,}))
    end,
    { silent = true, desc = "Fuzzy find in current buffer"}
  )

  vim.keymap.set('n', '<leader>fm',
    function()
      require('telescope.builtin').marks()
    end,
    { desc = "Find marks" }
  )
  set('n', '<leader>ff', function() ts_builtin.git_files() end, { desc = "Files (git)" })
  set('n', '<leader>fF', function() ts_builtin.find_files() end, { desc = "Files (cwd)" })
  set('n', '<leader>fb', function() ts_builtin.buffers() end, { desc = "Buffers" })
  set('n', '<leader>fm', function() ts_builtin.marks() end, { desc = "Marks" })
  set('n', '<leader>fC', function() ts_builtin.colorscheme() end, { desc = "Colorschemes" })
  set('n', '<leader>fj', function() ts_builtin.jumplist() end, { desc = "Jumps" })
  set('n', '<leader>fr', function() ts_builtin.registers() end, { desc = "Registers" })
  set('n', '<leader>fp', function() ts_builtin.profiles() end, { desc = "Profiles" })
  set('n', '<leader>fg', function() ts_builtin.live_grep() end, { desc = "Grep" })
  set('n', '<leader>fo', function() ts_builtin.oldfiles() end, { desc = "Oldfiles" })
  set('n', '<leader>fq', function() ts_builtin.quickfix() end, { desc = "Quickfix" })
  set('n', '<leader>fc', function() ts_builtin.command_history() end, { desc = "Command History" })
  set('n', '<leader>fv', function() ts_builtin.vim_options() end, { desc = "Vim Options" })
  set('n', '<leader>fk', function() ts_builtin.keymaps() end, { desc = "Keymaps" })
  set('n', '<leader>fs', function() ts_builtin.lsp_document_symbols() end, { desc = "Symbols" })
  set('n', 'gd', function() ts_builtin.lsp_definitions() end, { desc = "Goto Defintion" })
  set('n', 'gr', function() ts_builtin.lsp_references() end, { desc = "Goto References" })
  set('n', 'gI', function() ts_builtin.lsp_implementations() end, { desc = "Goto Implementations" })
  set('n', 'gy', function() ts_builtin.lsp_type_definitions() end, { desc = "Goto Typedefs" })
end

-- ------------------------------------------------------------------------------------------------------
-- fzf-lua
if PICKER == "fzf-lua" then
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
  set('n', '<leader>fc', function() require('fzf-lua').command_history() end, { desc = "Command History" })
  set('n', '<leader>fs', function() require('fzf-lua').lsp_document_symbols() end, { desc = "Symbols" })
  set('n', '<leader>fd', function() require('fzf-lua').lsp_document_diagnostics() end, { desc = "Diagnostics" })
  set('n', '<leader>f/', function() require('fzf-lua').live_grep({cwd = vim.lsp.buf.list_workspace_folders()[1]}) end, { desc = "Grep root dir" })
  set('n', 'gd', '<cmd>FzfLua lsp_definitions     jump_to_single_result=true ignore_current_line=true<cr>', { desc = "Goto Defintion" })
  set('n', 'gr', '<cmd>FzfLua lsp_references      jump_to_single_result=true ignore_current_line=true<cr>', { desc = "Goto References" })
  set('n', 'gI', '<cmd>FzfLua lsp_implementations jump_to_single_result=true ignore_current_line=true<cr>', { desc = "Goto Implementations" })
  set('n', 'gy', '<cmd>FzfLua lsp_typedefs        jump_to_single_result=true ignore_current_line=true<cr>', { desc = "Goto Typedefs" })
end

-- -----------------------------------------------------------------------------
-- commenting
set("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
set("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- -----------------------------------------------------------------------------
-- Lazy
set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Lazy" })

-- -----------------------------------------------------------------------------
-- Quick fix
set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

-- -----------------------------------------------------------------------------
-- Snacks Dashboard
set("n", "<leader>;", function() Snacks.dashboard() end, { desc = "Dashboard" })

-- -----------------------------------------------------------------------------
-- Mason
set("n", "<leader>m", "<cmd>Mason<cr>", { desc = "Mason" })

-- -----------------------------------------------------------------------------
-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- -----------------------------------------------------------------------------
-- Dap
set('n', '<C-n>', function() require('dap').step_over() end, { silent = true, desc = 'Dap - step over' })
set('n', '<C-s>', function() require('dap').step_into() end, { silent = true, desc = 'Dap - step into' })
set('n', '<C-o>', function() require('dap').step_out() end,  { silent = true, desc = 'Dap - step out' })
set('n', '<C-c>', function() require('dap').continue() end,  { silent = true, desc = 'Dap - continue' })
set('n', '<leader>dm', function() require('dap').list_breakpoints(true) end, { silent = true, desc = 'List breakpoints'})

-- -----------------------------------------------------------------------------
-- Toggle -  I can't get Snacks.Toogle to work, so I'm just doing a few simple toggles manually
set("n", "<leader>uh", function()
    if vim.lsp.inlay_hint.is_enabled() then
      vim.lsp.inlay_hint.enable(false)
    else
      vim.lsp.inlay_hint.enable(true)
    end
  end,
  { desc = "Inlay hints" }
)
set("n", "<leader>uL", "<cmd>set relativenumber!<CR>", { desc = "Relative number" })
set("n", "<leader>ua", function() Snacks.toggle.line_number() end, { desc = "Line Number" })

-- -----------------------------------------------------------------------------
-- Snacks - These snacks keymaps don't seem to be working 
-- Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
-- Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
-- Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
-- Snacks.toggle.diagnostics():map("<leader>ud")
-- Snacks.toggle.line_number():map("<leader>ul")
-- Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" }):map("<leader>uc")
-- Snacks.toggle.option("showtabline", { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline" }):map("<leader>uA")
-- Snacks.toggle.treesitter():map("<leader>uT")
-- Snacks.toggle.option("background", { off = "light", on = "dark" , name = "Dark Background" }):map("<leader>ub")
-- Snacks.toggle.dim():map("<leader>uD")
-- Snacks.toggle.animate():map("<leader>ua")
-- Snacks.toggle.indent():map("<leader>ug")
-- Snacks.toggle.scroll():map("<leader>uS")
-- Snacks.toggle.profiler():map("<leader>dpp")
-- Snacks.toggle.profiler_highlights():map("<leader>dph")
-- local Snacks = require('Snacks')
-- if vim.lsp.inlay_hint then
-- Snacks.toggle.inlay_hints():map("<leader>uh")
-- end
-- set("n", "<leader>uh", function() Snacks.toggle.inlay_hints() end, { desc = "Toggle inlay hints" })
-- set("n", "<leader>uL", function() Snacks.toggle.option("relativenumber", { name = "Relative Number" }) end, { desc = "Relative Number" })
-- set("n", "<leader>ul", function() if vim.opt.relativenumber == true then vim.opt.relativenumber = false else vim.opt.relativenumber = true end end, { desc = "Rel nums" })
-- floating terminal
-- set("n", "<leader>fT", function() Snacks.terminal() end, { desc = "Terminal (cwd)" })
-- set("n", "<leader>ft", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
-- set("n", "<c-/>",      function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
-- set("n", "<c-_>",      function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "which_key_ignore" })
