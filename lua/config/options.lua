vim.opt.termguicolors = true

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.diagnostic.config({
	virtual_text = true
})
-- Syntax base

--vim.api.nvim_set_hl(0, "Comment", { fg = 8, italic = true })
--vim.api.nvim_set_hl(0, "String", { fg = 2 })
--vim.api.nvim_set_hl(0, "Keyword", { fg = 4, bold = true })
--vim.api.nvim_set_hl(0, "Function", { fg = 6 })
--vim.api.nvim_set_hl(0, "Type", { fg = 3 })
--vim.api.nvim_set_hl(0, "Identifier", { fg = 7 })
--vim.api.nvim_set_hl(0, "Constant", { fg = 1 })

