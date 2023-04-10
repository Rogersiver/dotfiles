require('plugins')
require('cmp-config')
require('lsp-config')
require('tree')
require('mappings')
require('null-ls-config')
require('scrollbar-config')

vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.cursorline = true

vim.cmd [[

colorscheme kanagawa
set colorcolumn=80
set clipboard+=unnamedplus
set undofile
set shiftwidth=2
set autoindent
set smartindent
set wildmenu
set tabstop=2
set ruler
set hlsearch
set incsearch

autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

]]



