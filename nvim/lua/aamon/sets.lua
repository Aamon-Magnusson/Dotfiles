vim.g.mapleader = " "

vim.opt.wrap = false
vim.opt.path = vim.opt.path + "**"
vim.opt.wildmenu = true
vim.opt.complete = vim.opt.complete + "kspell"
vim.opt.completeopt = "menuone,noselect"
vim.opt.compatible = false
vim.opt.binary = true
vim.opt.errorbells = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.lazyredraw = true
vim.opt.showmode = true
vim.opt.showmatch = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true
vim.opt.hidden = true
vim.opt.laststatus = 3
vim.opt.timeoutlen = 500
-- Make splits go to "slave side"
vim.opt.splitbelow = true
vim.opt.splitright = true
-- Might be too distracting, but I'll try it out
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
-- Mouse support (Hopefully I won't use it much)
vim.opt.mouse = a
-- markdown code blocks
vim.g.markdown_fenced_languages = {'java', 'bash', 'python', 'c'}
vim.g.java_ignore_javadoc=1
-- netrw sets
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_altv = 1
