require("config.lazy")

vim.keymap.set("n", "<space>rf", "<cmd>source %<CR>", { desc = "Run file"})
vim.keymap.set("n", "<space>rl", ":.lua<CR>", { desc = "Run line" })
vim.keymap.set("v", "<space>r", ":lua<CR>")

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
