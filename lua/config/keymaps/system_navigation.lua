-- Explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {desc = "toggle tree file explorer"})

-- Open NeoVim config
vim.keymap.set("n", "Qc", function()
   local path = vim.fn.stdpath('config')
   vim.cmd("NvimTreeClose")
   local command = string.format("NvimTreeOpen %s", path)
   vim.cmd(command)
end)

vim.keymap.set("n", "Qd", function()
   local path = vim.fn.stdpath('data')
   vim.cmd("NvimTreeClose")
   local command = string.format("NvimTreeOpen %s", path)
   vim.cmd(command)
end)

vim.keymap.set("n", "Qw", function ()
   vim.cmd("NvimTreeClose")
   local cwd = vim.fn.getcwd()
   vim.cmd(string.format("NvimTreeOpen %s", cwd))
end)

