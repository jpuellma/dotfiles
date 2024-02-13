-- Make sure to set `mapleader` before lazy so mappings stay correct.
vim.g.mapleader = " "

vim.opt.wrap = false

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

--[[
This formatoptions line gets ignored by Nvim as discusssed here:
https://neovim.discourse.group/t/options-formatoptions-not-working-when-put-in-init-lua/3746/5
use command :verb set formatoptions to see the last file that modifies
formatoptions setting.
--]]
vim.opt.formatoptions:remove({ "c", "r", "o", "t" })

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.colorcolumn = { 80 }

vim.scrolloff = 4

vim.opt.modelines = 10

vim.opt.updatetime = 50

vim.cmd("set signcolumn=yes:1")

vim.opt.compatible = false
vim.opt.showmode = true
vim.opt.textwidth = 0
vim.cmd("set wildmode=list:longest")
vim.opt.laststatus = 2

vim.cmd("autocmd BufNewFile,BufRead *.py set ts=4 sw=4")

vim.opt.spelllang = "en_us"
vim.opt.spell = false
vim.cmd("autocmd BufNewFile,BufRead *.txt set spell")
vim.cmd("autocmd BufNewFile,BufRead *.md set spell")
vim.cmd("map <F7> :set spell! spelllang=en_us<cr>")

vim.opt.cursorline = true
vim.api.nvim_create_autocmd('ColorScheme', {
  command = [[highlight CursorLine guibg=#000000]]
})
