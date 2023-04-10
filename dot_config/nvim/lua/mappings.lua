
vim.g.mapleader = " "

 local map = vim.api.nvim_set_keymap
 local map2 = vim.keymap.set
 local opts = { noremap = true }


 map ('n', '<leader>vv', '<Cmd>vsplit<CR>', opts)
 map ('n', '<leader>vs', '<Cmd>split<CR>', opts)
 -- -- BUFFER MAPS
-- -- Move to previous/next
map('n', '<tab>', '<Cmd>BufferNext<CR>', opts)
map('n', '<S-tab>', '<Cmd>BufferPrevious<CR>', opts)
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
map2('n', '<leader>ff', builtin.find_files, opts)
map2('n', '<leader>fg', builtin.live_grep, opts)
map2('n', '<leader>fb', builtin.buffers, opts)
map2('n', '<leader>fo', builtin.oldfiles, opts)
map2('n', '<leader>fh', builtin.help_tags, opts)
map2('n', '<leader>th', builtin.colorscheme, opts)
map2('n', '<leader>ts', '<cmd>Telescope<CR>', opts)

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
map("n", "<leader>zn", ":TZNarrow<CR>", opts)
map("v", "<leader>zn", ":'<,'>TZNarrow<CR>", opts)
map("n", "<leader>zf", ":TZFocus<CR>", opts)
map("n", "<leader>zm", ":TZMinimalist<CR>", opts)
map("n", "<leader>za", ":TZAtaraxis<CR>", opts)

-- Comments
map('n', '<leader>/', '<cmd>CommentToggle<CR>', opts)
map('v', '<leader>/', ":'<,'>CommentToggle<CR>", opts)

-- SPECTRE

map('n', '<leader>S', '<cmd>lua require("spectre").open()<CR>', {
    noremap = true,
    desc = "Open Spectre"
})
map('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    noremap = true,
    desc = "Search current word"
})
map('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    noremap = true,
    desc = "Search current word"
})
map('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    noremap = true,
    desc = "Search on current file"
})


--UndoTree
map2('n', '<leader>u', vim.cmd.UndotreeToggle)

--Hop
local hop = require('hop')
local directions = require('hop.hint').HintDirection
map2('', 'f', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, {remap=true})
map2('', 'F', function()
  hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, {remap=true})
map2('', 't', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = -1 })
end, {remap=true})
map2('', 'T', function()
  hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 1 })
end, {remap=true})

-- TS Context
map('n', '<leader>tc', '<CMD>TSContextToggle<CR>', opts)

-- Twilight
map('n', '<leader>tw', '<CMD>Twilight<CR>', opts)

-- restore the session for the current directory
map("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]], {})

-- restore the last session
map("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], {})

-- stop Persistence => session won't be saved on exit
map("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], {})

-- new term in split
map("n", "<leader>tt", "<cmd>terminal<CR>", opts)
map("t", "˙", "<Cmd>wincmd h<CR>", opts)
map("t", "∆", "<Cmd>wincmd j<CR>", opts)
map("t", "˚", "<Cmd>wincmd k<CR>", opts)
map("t", "¬", "<Cmd>wincmd l<CR>", opts)

map("n", "˙", "<Cmd>wincmd h<CR>", opts)
map("n", "∆", "<Cmd>wincmd j<CR>", opts)
map("n", "˚", "<Cmd>wincmd k<CR>", opts)
map("n", "¬", "<Cmd>wincmd l<CR>", opts)

map("n", "Ó", "<Cmd>wincmd H<CR>", opts)
map("n", "Ô", "<Cmd>wincmd J<CR>", opts)
map("n", "", "<Cmd>wincmd K<CR>", opts)
map("n", "Ò", "<Cmd>wincmd L<CR>", opts)
vim.keymap.set('n', 'ø', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', 'ø', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
