local g = vim.g

vim.g.mapleader = ','


vim.opt.number = true 
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab =  true
-- vim.opt.termguicolors = true
--
vim.api.nvim_create_autocmd("FileType", {
	pattern = "php",
	command = "setlocal shiftwidth=4 tabstop=4"
})
