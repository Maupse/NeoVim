vim.notify("starting neovim...")

if not vim.os then
    if vim.fn.has("linux") == 1 then
        vim.os = "linux"
    elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
        vim.os = "windows"
    end
end

vim.notify(string.format("Detected OS is = %s", vim.os))

vim.g.mapleader = " "
require("config")
vim.notify("finished loading neovim!")
