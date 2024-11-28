vim.keymap.set("v", "<leader>c", '"*y')

vim.keymap.set("n", "<leader>v", '"*p')

vim.api.nvim_create_user_command("W", "w", {})

local function vscode_incompatible()
    vim.keymap.set("n", "<leader>l", ":Lazy<CR>")
    vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

    if vim.os == "windows" then 
        vim.keymap.set("n", "<leader>d", function()
           local env = os.getenv("LocalAppData")
           local command = string.format("Explore %s/nvim", env)
           vim.cmd(command) 
        end)
    end

    --move line up or down. The == i auto indent--
    vim.keymap.set("n", "<A-j>", ":m +1<CR>==")
    vim.keymap.set("n", "<A-k>", ":m -2<CR>==")
end

-- Harpoon Keymaps
local function harpoon_keymaps() 
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>a", mark.add_file, {})
    
    vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, {})
    vim.keymap.set("n", "<A-h>", ui.nav_prev)
    vim.keymap.set("n", "<A-l>", ui.nav_next)

    vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, {})
    vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, {})
    vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, {})
    vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, {})
end

if not vim.g.vscode then
    vscode_incompatible()
    harpoon_keymaps()
else
    vim.notify("did not load harpoon because vscode was loaded")
end
