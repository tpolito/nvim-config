vim.g.mapleader = "'"
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end)
