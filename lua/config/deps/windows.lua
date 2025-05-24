function ensure_dependency(cmd, install_cmds, wait)
    wait = wait or false
    local multiple = (type(install_cmds) == "table")
    if not multiple and type(install_cmds) ~= "string"  then
        error("Expected {string, string, ..., string} or string ,got: " .. type(install_cmds))
    end

    if vim.fn.executable(cmd) == 0 then
        vim.notify("Installing " .. cmd .. "...")
        local Terminal = require("toggleterm.terminal").Terminal
        local term = Terminal:new({
            direction = "float",
            close_on_exit = false,
            auto_scroll = true,

        })


        local done = false
        if wait then
            term.on_close = function() 
                done = true
                vim.notify("Installation Terminal closed")
            end
        end

        term:toggle()

        if multiple then
            for _, str in ipairs(install_cmds) do
                term:send(str)
            end
        else
            term:send(install_cmds)
        end

        if wait then
            vim.wait(100000, function()
                return done
            end, 100)
        end
        
    end
end

-- Scoop
ensure_dependency("scoop", {
    "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser",
    "Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression"
}, true)

ensure_dependency("git", "scoop install git")
ensure_dependency("node", "scoop install nodejs")

-- Telescope
ensure_dependency("rg", "scoop install ripgrep")
ensure_dependency("fd", "scoop install fd")

ensure_dependency("gcc", "scoop install msys2")
if vim.fn.executable("gcc") == 0 then
    local dep = "pacman -S base-devel mingw-w64-ucrt-x86_64-toolchain";
    vim.notify("WARINING: Make sure to install mingw toolchain via msys2: " .. dep, vim.log.levels.WARN)
    ensure_dependency("gcc", "scoop install msys2")
end
