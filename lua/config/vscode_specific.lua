local vscode = require("vscode")

vscode.update_config("editor.lineNumbers", "relative")

vim.keymap.set('n', "<leader>e", function() vscode.call("workbench.view.explorer") end, {})

vim.keymap.set("n", "<leader>qf", function() vscode.call("editor.action.quickFix") end, {})

vim.keymap.set("n", "<leader>af", function() vscode.call("editor.action.autoFix") end, {})

vim.keymap.set("n", "<leader>a", function() vscode.call("editor.action.fixAll") end, {})

vim.keymap.set("n", "<leader>rs", function() vscode.call("vscode-neovim.restart") end, {})
