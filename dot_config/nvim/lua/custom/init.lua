local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
  pattern = { "lua", "javascript", "python", "yaml" }, -- Add or remove file types as needed
  command = "setlocal colorcolumn=80",
})
-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

autocmd("BufWritePre", {
  pattern = ".py", -- You can specify file types like "*.lua" to target specific files
  callback = function()
    vim.lsp.buf.format() -- This is the formatting command for the LSP
  end,
})
