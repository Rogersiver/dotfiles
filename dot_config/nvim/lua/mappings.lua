
vim.g.mapleader = " "

local map = vim.api.nvim_set_keymap
local opts = { noremap = true }

-- BUFFER MAPS
-- Move to previous/next
map('n', '<Leader>b,', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<Leader>b.', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<Leader>b<left>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<Leader>b<right>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<Leader>b1', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<Leader>b2', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<Leader>b3', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<Leader>b4', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<Leader>b5', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<Leader>b6', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<Leader>b7', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<Leader>b8', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<Leader>b9', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<Leader>b0', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<Leader>bt', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<Leader>bcc', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
map('n', '<Leader>bx', '<Cmd>BufferWipeout<CR>', opts)
-- Close commands
map('n', '<Leader>bco', '<Cmd>BufferCloseAllButCurrentOrPinned<CR>', opts)
map('n', '<Leader>bc<Left>', '<Cmd>BufferCloseBuffersLeft<CR>', opts)
map('n', '<Leader>bc<Right>', '<Cmd>BufferCloseBuffersRight<CR>', opts)
-- Magic buffer-picking mode
map('n', '<Leader>bp', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Leader>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Leader>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- TELESCOPE
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)

--Trouble
map('n', '<leader>tb', '<Cmd>TroubleToggle<CR>', opts)

--TREE

map('n', '<C-n>', '<Cmd>NvimTreeToggle<CR>', opts)
map('n', '<leader>ee', '<Cmd>NvimTreeToggle<CR>', opts)
map('n', '<leader>eo', '<Cmd>NvimTreeOpen<CR>', opts)
map('n', '<leader>er', '<Cmd>NvimTreeRefresh<CR>', opts)
map('n', '<leader>ef', '<Cmd>NvimTreeFocus<CR>', opts)
map('n', '<leader>ec', '<Cmd>NvimTreeClose<CR>', opts)

--TRUEZEN

local api = vim.api

api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
api.nvim_set_keymap("n", "<leader>zf", ":TZFocus<CR>", {})
api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
api.nvim_set_keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})

-- or
local truezen = require('true-zen')
local keymap = vim.keymap

keymap.set('n', '<leader>zn', function()
  local first = 0
  local last = vim.api.nvim_buf_line_count(0)
  truezen.narrow(first, last)
end, { noremap = true })
keymap.set('v', '<leader>zn', function()
  local first = vim.fn.line('v')
  local last = vim.fn.line('.')
  truezen.narrow(first, last)
end, { noremap = true })
keymap.set('n', '<leader>zf', truezen.focus, { noremap = true })
keymap.set('n', '<leader>zm', truezen.minimalist, { noremap = true })
keymap.set('n', '<leader>za', truezen.ataraxis, { noremap = true })
