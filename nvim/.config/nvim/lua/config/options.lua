local opt = vim.opt
opt.shiftwidth = 2
opt.expandtab = true
opt.tabstop = 2
opt.number = true
opt.relativenumber = true
opt.smartcase = true
opt.splitright = true
opt.signcolumn = "yes:2"
opt.mouse = "a"
opt.termguicolors = true
opt.showmode = false
opt.colorcolumn = "80,120"
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.ignorecase = true
opt.wrap = false
opt.confirm = true
opt.laststatus = 3
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldenable = false
opt.swapfile = false
-- vim.opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
-- vim.opt.autoformat = false

-- -----------------------------------------------------------------------------
-- Colorscheme Options

-- sainnhe/edge
-- vim.g.edge_enable_italic = true
-- vim.g.edge_style = "neon"
-- vim.g.edge_style = "aura"

-- sainnhe/everforest
-- vim.g.everforest_enable_italic = true
-- vim.g.everforest_background = 'hard'
-- vim.g.everforest_background = 'medium'
-- vim.g.everforest_background = 'soft'

-- sainnhe/sonokai
-- vim.g.sonokai_enable_italic = true
vim.g.sonokai_style = "atlantis"
-- vim.g.sonokai_style = "maia"
-- vim.g.sonokai_style = "andromeda"
