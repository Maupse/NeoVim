vim.keymap.set("n", "<leader>g", function ()

    local Terminal = require("toggleterm.terminal").Terminal
    local term = Terminal:new({
        direction = "float",
        close_on_exit = false,
        auto_scroll = true,

    })
    term:toggle()
    term:send("git status")
end, {desc = "open lazy menu"})


vim.keymap.set("n", "<leader>G", function ()
    local Terminal = require("toggleterm.terminal").Terminal
    local path = vim.fn.expand("%:p:h")
    local term = Terminal:new({
        direction = "float",
        close_on_exit = false,
        auto_scroll = true,
        dir = path

    })
    term:toggle()
    term:send("git status")
end, {desc = "open lazy menu"})
