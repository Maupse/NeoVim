local vscode = require("vscode")

--keep terms highlightet when searching
vim.opt.hlsearch = false

-- Copy pasting from clipboard
vim.keymap.set("v", "<leader>c", '"*y')

vim.keymap.set("n", "<leader>v", '"*p')

-- Misspelling w still works
vim.api.nvim_create_user_command("W", "w", {})

-- Writing Buffer with strg+s
vim.keymap.set("n", "<C-s>", ":w<CR>")

vscode.update_config("editor.lineNumbers", "relative")

vim.keymap.set('n', "<leader>e", function() vscode.call("workbench.view.explorer") end, {})

vim.keymap.set("n", "<leader>qf", function() vscode.call("editor.action.quickFix") end, {})

vim.keymap.set("n", "<leader>af", function() vscode.call("editor.action.autoFix") end, {})

vim.keymap.set("n", "<leader>a", function() vscode.call("editor.action.fixAll") end, {})

vim.keymap.set("n", "<leader>rs", function() vscode.call("vscode-neovim.restart") end, {})
