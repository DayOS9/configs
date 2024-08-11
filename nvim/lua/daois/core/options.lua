local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

-- tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
--opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursorline
opt.cursorline = true

--colorcolumn (side column)
opt.colorcolumn = ""

-- appearance
opt.termguicolors = true
--opt.background = "dark"
opt.signcolumn = "yes" -- so text does not shift

-- backspace
opt.backspace = "indent,eol,start"

-- splitting windows
opt.splitright = true -- spilt vertial window to right
opt.splitbelow = true -- horizontal split

-- cursor
opt.guicursor = ""
opt.guicursor = "a:blinkon100"

-- lua line related
opt.showmode = false

-- remove highlighting when searching
opt.hlsearch = false
-- highlight incrementally when typing
opt.incsearch = true

--when scrolling, always keep 8 lines above and below cursor
vim.opt.scrolloff = 8

--change spacing specifically for cpp/c
vim.api.nvim_create_autocmd("FileType", {
	pattern = "cpp",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = function()
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "py",
	callback = function()
		vim.opt_local.smarttab = true
	end,
})
