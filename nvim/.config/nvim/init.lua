require("config.lazy")
print("AHHH")
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "Excute file"})
vim.keymap.set("n", "<space>x", ":.lua<CR>", { desc = "Execute line" })
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
