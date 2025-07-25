local set = vim.keymap.set

local root_dir = function() -- Either show git directory or cwd
  local name = vim.fs.dirname(vim.fs.find('.git', { upward = true })[1])
  if name ~= nil then
    return name
  else
    return vim.fn.getcwd()
  end
end
-- -----------------------------------------------------------------------------
-- General
set("n", "<space>rf", "<cmd>source %<CR>", { desc = "Run file"})
set("n", "<space>rl", ":.lua<CR>", { desc = "Run line" })
set("v", "<space>r", ":lua<CR>")
set('n', '<leader>qq', ":qa<CR>", { desc = "Quit all" })
set('n', '<leader>qw', ":wq<CR>", { desc = "Save and Quit" })
set('n', '<leader>ff', "<cmd>lua print(vim.fn.getcwd())<CR>", { desc = "Current working dir" })
set('n', '<leader>fd', "<cmd>lua print(vim.fn.expand('%:p:h'))<CR>", { desc = "Current buffer's dir" })
set('n', '<leader>fc', "<cmd>chdir %:p:h<CR>", { desc = "Change to buf's dir" })
set({ "n", "i", "s" }, '<esc>', function() vim.cmd("noh") return "<esc>" end, { silent = true, expr = true, desc = "No Highlight" })
set("n", "<leader>n", ":Notifications<CR>", { desc = "Notifications" })

-- -----------------------------------------------------------------------------
-- Mini
set('n', '-', function() if not require('mini.files').close() then require('mini.files').open() end end, { desc = "Open Mini.Files" })

-- -----------------------------------------------------------------------------
-- Buffers
set('n', '<leader>bs', "<cmd>w<CR>", { desc = "Save buffer" })
set("n", "<leader>bn", "<cmd>bnext<cr>", { silent = true, desc = "Next" })
set("n", "<leader>bb", "<cmd>bprevious<cr>", { silent = true, desc = "Back" })
set("n", "<leader>bc", "<cmd>bd<cr>", { silent = true, desc = "Close buffer" })
set("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete buffer" })
set("n", "<leader>bo", function() Snacks.bufdelete.other() end, { desc = "Delete other buffers" })
set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Prev Buffer" })
set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next Buffer" })

-- -----------------------------------------------------------------------------
-- Window Splits
set('n', "<leader>|", "<cmd>vsplit<CR>", { desc = "Vertical Split" })
set('n', "<leader>-", "<cmd>hsplit<CR>", { desc = "Horizontal Split" })

-- -----------------------------------------------------------------------------
-- Window size
set('n', '<M-Down>', '<C-w>-', { silent = true, desc = 'Decrease window height' })
set('n', '<M-Up>',   '<C-w>+', { silent = true, desc = 'Increase window height' })
set('n', '<M-Left>', '<C-w><', { silent = true, desc = 'Decrease window width' })
set('n', '<M-Right>','<C-w>>', { silent = true, desc = 'Increase window width' })

-- -----------------------------------------------------------------------------
-- Window movement
set('n', '<C-j>', [[<cmd>wincmd j<CR>]], { silent = true, desc = 'Move window down' })
set('n', '<C-h>', [[<cmd>wincmd h<CR>]], { silent = true, desc = 'Move window left' })
set('n', '<C-k>', [[<cmd>wincmd k<CR>]], { silent = true, desc = 'Move window up' })
set('n', '<C-l>', [[<cmd>wincmd l<CR>]], { silent = true, desc = 'Move window right' })

-- -----------------------------------------------------------------------------
-- Move lines up/down
set('n', '<A-j>', ':m .+1<CR>==', { silent = true, desc = 'Move line down' })
set('n', '<A-k>', ':m .-2<CR>==', { silent = true, desc = 'Move line up' })
set('v', '<A-j>', ":m '>+1<CR>gv=gv", { silent = true, desc = 'Move line down' })
set('v', '<A-k>', ":m '<-2<CR>gv=gv", { silent = true, desc = 'Move line down' })

-- -----------------------------------------------------------------------------
-- Better indenting in visual mode
set("v", "<", "<gv", { desc = "Indent left and reselect" })
set("v", ">", ">gv", { desc = "Indent right and reselect" })

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
-- LSP
set("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<CR>", { desc = "Source/Header"} )
set("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format()<CR>", { desc = "Format"} )

-- -----------------------------------------------------------------------------
-- Snacks - Snacks.toggle seems to be working now??
Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
Snacks.toggle.diagnostics():map("<leader>ud")
Snacks.toggle.line_number():map("<leader>ul")
Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" }):map("<leader>uc")
Snacks.toggle.option("showtabline", { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline" }):map("<leader>uA")
Snacks.toggle.treesitter():map("<leader>uT")
Snacks.toggle.option("background", { off = "light", on = "dark" , name = "Dark Background" }):map("<leader>ub")
Snacks.toggle.dim():map("<leader>uD")
Snacks.toggle.animate():map("<leader>ua")
Snacks.toggle.indent():map("<leader>ug")
Snacks.toggle.scroll():map("<leader>uS")
Snacks.toggle.profiler():map("<leader>dpp")
Snacks.toggle.profiler_highlights():map("<leader>dph")
Snacks.toggle.inlay_hints():map("<leader>uh")

set('n', "<leader>,", function() Snacks.picker.buffers() end, { desc = "Buffers" } )
set('n', "<leader>/", function() Snacks.picker.grep({hidden = true, dirs = {root_dir()} }) print(root_dir()) end, { desc = "Grep" } )
set('n', "<leader>:", function() Snacks.picker.command_history() end, { desc = "Command History" } )
set('n', "<leader><space>", function() Snacks.picker.files({hidden=true, dirs = {root_dir()}}) end, {desc = "Find Files" })
-- find
set('n', "<leader>sb", function() Snacks.picker.buffers() end, {desc = "Buffers"} )
set('n', "<leader>sc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config")[1] } ) end, { desc = "Find Config File" } )
set('n', "<leader>sf", function() Snacks.picker.files({hidden = true}) end, { desc = "Find Files" })
set('n', "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })
set('n', "<leader>fr", function() Snacks.picker.recent() end, { desc = "Recent"  })
set('n', "<leader>sn", "<cmd>Noice history<CR>", { desc = "Notifications" })
set('n', "<leader>sp", "<cmd>Noice pick<CR>", { desc = "Notification picker" })

-- git
set('n', "<leader>gc", function() Snacks.picker.git_log() end, { desc = "Git Log" } )
set('n', "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
-- Grep
set('n', "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" } )
set('n', "<leader>sB", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" } )
set('n', "<leader>sg", function() Snacks.picker.grep({hidden=true}) end, { desc = "Grep" } )
set({'n', 'v'}, "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "Visual selection or word" } )
-- search
set('n', '<leader>s"', function() Snacks.picker.registers() end, { desc = "Registers" } )
set('n', "<leader>sa", function() Snacks.picker.autocmds() end, { desc = "Autocmds" } )
set('n', "<leader>sc", function() Snacks.picker.command_history() end, { desc = "Command History" } )
set('n', "<leader>sC", function() Snacks.picker.commands() end, { desc = "Commands" } )
set('n', "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" } )
set('n', "<leader>sh", function() Snacks.picker.help() end, { desc = "Help Pages" } )
set('n', "<leader>sH", function() Snacks.picker.highlights() end, { desc = "Highlights" } )
set('n', "<leader>sj", function() Snacks.picker.jumps() end, { desc = "Jumps" } )
set('n', "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" } )
set('n', "<leader>sl", function() Snacks.picker.loclist() end, { desc = "Location List" } )
set('n', "<leader>sM", function() Snacks.picker.man() end, { desc = "Man Pages" } )
set('n', "<leader>sm", function() Snacks.picker.marks() end, { desc = "Marks" } )
set('n', "<leader>sR", function() Snacks.picker.resume() end, { desc = "Resume" } )
set('n', "<leader>sq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" } )
set('n', "<leader>uC", function() Snacks.picker.colorschemes() end, { desc = "Colorschemes" } )
set('n', "<leader>qp", function() Snacks.picker.projects() end, { desc = "Projects" } )
-- LSP
set('n', "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" } )
set('n', "gr", function() Snacks.picker.lsp_references() end, { nowait = true, desc = "References" } )
set('n', "gI", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" } )
set('n', "gy", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" } )
set('n', "<leader>ss", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" } )
