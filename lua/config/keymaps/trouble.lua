-- Vim diagnostics
vim.keymap.set('n', "<leader>k", "<cmd>lua vim.diagnostic.open_float()<cr>")

vim.keymap.set('n', "<leader>lf", "<cmd>lua vim.diagnostic.open_float()<cr>")
-- [d go to prev diagnostic
-- ]d go to next diagnostic

-- Trouble.nvim
vim.keymap.set("n", "<leader>lt", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>lT", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })

vim.keymap.set("n", "<leader>ls", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })

vim.keymap.set("n", "<leader>ll", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions / references / ... (Trouble)" })

vim.keymap.set("n", "<leader>lL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })

vim.keymap.set("n", "<leader>lq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })


