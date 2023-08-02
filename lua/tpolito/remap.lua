vim.g.mapleader = "'"
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
-- vim.keymap.set("n", "<leader>e", vim.cmd.Lex)
vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end)
vim.keymap.set("n", "U", vim.cmd.redo)
