vim.opt.cursorlineopt = "both"
vim.opt.cursorline = true
vim.opt.colorcolumn = { 80 }

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 3

vim.opt.undodir = "/home/met/.nvim/undo-dir"
vim.opt.undofile = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.textwidth = 80

vim.opt.conceallevel = 2

vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_math = true
vim.g.vim_markdown_new_list_item_indent = 0

vim.cmd([[filetype plugin on]])
vim.opt_local.formatoptions:remove("t")

-- config indents
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	callback = function()
		vim.cmd([[set indentexpr=]])
	end,
})

-- go to previous line when opening file
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_exec('silent! normal! g`"zv', false)
	end,
})

-- auto bulleted list
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.formatoptions:append("r") -- `<CR>` in insert mode
		vim.opt_local.formatoptions:append("o") -- `o` in normal mode
		vim.opt_local.formatoptions:remove("t")
		vim.opt_local.comments = {
			"b:- [ ]", -- tasks
			"b:- [x]",
			"b:*", -- unordered list
			"b:-",
			"b:+",
		}
	end,
})

--[[  GRUVBOX  ]]
--
-- vim.g.gruvbox_material_enable_bold = 1
-- vim.g.gruvbox_material_enable_italic = 1
-- vim.g.gruvbox_material_foreground = "mix"
--
-- vim.cmd([[colorscheme gruvbox-material]])

local keywords = {
	"debug",
	"import",
	"repeat",
	"return",
	"storage",
	"function",
	"operator",
	"directive",
	"exception",
	"conditional",
	"directive.define",
}

vim.cmd([[hi clear @keyword]])
vim.cmd([[hi link @keyword RedItalic]])

for _, v in pairs(keywords) do
	vim.cmd("hi clear @keyword." .. v)
	vim.cmd("hi link @keyword." .. v .. " RedItalic")
end

vim.cmd([[hi clear Conceal]])
vim.cmd([[hi link Conceal Blue]])
vim.cmd([[hi clear @markup.italic ]])
vim.cmd([[hi link @markup.italic PurpleItalic ]])
vim.cmd([[hi clear @markup.strong]])
vim.cmd([[hi link @markup.strong YellowBold]])
vim.cmd([[hi clear @constant]])
vim.cmd([[hi link @constant PurpleBold]])