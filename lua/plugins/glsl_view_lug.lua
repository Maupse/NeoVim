return {
    "timtro/glslView-nvim",
    ft = {"glsl", "frag", "vert", "comp", "geom", "tesc", "tese"},
    version = "*",
    build = function()
        if vim.fn.executable("glslViewer") == 0 and vim.os == "windows" then
            vim.notify("Opening scoop installation")
            local Terminal = require("toggleterm.terminal").Terminal
            local term = Terminal:new({
                direction = "float",
                close_on_exit = false,
                auto_scroll = true,

            })
            term:toggle()
            term:send("scoop bucket add versions")
            term:send("scoop install glslviewer")
        end
    end,
    config = function()
        require("glslView").setup {}
    end,
}
