require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<C-l>", ":NoiceDismiss<CR>", { desc = "Dismiss Popup Messages" })

map("n", "<C-s>", "<cmd> w <cr>")
map("i", "<C-s>", "<cmd> w <cr>")
map("v", "<C-s>", "<cmd> w <cr>")
