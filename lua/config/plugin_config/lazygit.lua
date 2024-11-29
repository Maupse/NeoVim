if vim.os == "windows" then
    ensure_dependency("lazygit", "scoop bucket add extras")
    ensure_dependency("lazygit", "scoop install lazygit")
end

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function lazygit_toggle()
  lazygit:toggle()
end

