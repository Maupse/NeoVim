vim.notify("starting neovim...")

if not vim.os then
    if vim.fn.has("linux") == 1 then
        vim.os = "linux"
    elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
        vim.os = "windows"
    end
end

function ensure_dependency(cmd, install_cmd)
    if vim.fn.executable(cmd) == 0 then
        print("Installing " .. cmd .. "...")
        vim.fn.system(install_cmd)
    end
end


vim.notify(string.format("Detected OS is = %s", vim.os))

vim.g.mapleader = " "
require("config")
vim.notify("finished loading neovim!")
