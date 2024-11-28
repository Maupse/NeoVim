-- Most useful default keybinds:
-- <C-W> followed by h j k l will switch windows
-- <C-W>s splits horizontally and adds a new window on top
-- <C-W>v splits vertically and adds a new window on the left
vim.keymap.set("v", "<leader>c", '"*y')

vim.keymap.set("n", "<leader>v", '"*p')

vim.api.nvim_create_user_command("W", "w", {})

vim.keymap.set("n", "<C-s>", ":w<CR>")

local function vscode_incompatible()
    vim.keymap.set("n", "<leader>l", ":Lazy<CR>")
    vim.keymap.set("n", "<leader>m", ":Mason<CR>")
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

local function lsp_keymaps()
    -- Attatch some Keybinds that are available when the lsp is active
    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      callback = function(event)
        local opts = {buffer = event.buf}

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

      end,
    })
end

if not vim.g.vscode then
    vscode_incompatible()
    harpoon_keymaps()
    lsp_keymaps()
end

