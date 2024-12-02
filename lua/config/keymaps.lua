-- Most useful default keybinds:
-- <C-W> followed by h j k l will switch windows
-- <C-W>s splits horizontally and adds a new window on top
-- <C-W>v splits vertically and adds a new window on the left


-- Copy pasting from clipboard
vim.keymap.set("v", "<leader>c", '"*y', {desc = "copy to clipboard"})

vim.keymap.set("n", "<leader>v", '"*p', {desc = "paste from clipboard"})

-- Misspelling w still works
vim.api.nvim_create_user_command("W", "w", {desc = "write the buffer"})

-- Writing Buffer with strg+s
vim.keymap.set("n", "<C-s>", ":w<CR>", {desc = "write the buffer"})


local function terminal()
    -- Terminal keymaps
    -- The [[string literal]] are string literal, meaning escape characters like \ are mapped as strings
    function set_terminal_keymaps()
        local opts = {buffer = 0, desc = "escapes terminal mode"}
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
end


-- Basic Menus
vim.keymap.set("n", "<leader>l", ":Lazy<CR>", {desc = "open lazy menu"})
vim.keymap.set("n", "<leader>m", ":Mason<CR>", {desc = "open mason menu"})
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {desc = "toggle tree file explorer"})
vim.keymap.set("n", "<leader>.e", ":NvimTreeOpen .<CR>", {desc = "open tree in dir neovim was called in"})

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua lazygit_toggle()<CR>",
{desc = "open git custom terminal", noremap = true})

-- Going to the last buffer with Backspace
vim.keymap.set("n", "<BS>", ":b#<CR>", {desc = "open last buffer"})

-- Open NeoVim config
if vim.os == "windows" then 
    vim.keymap.set("n", "<leader>d", function()
       local env = os.getenv("LocalAppData")
       local command = string.format("NvimTreeOpen %s/nvim", env)
       vim.cmd(command)
    end)
end

--Move Line up or down. The == i auto indent--
vim.keymap.set("n", "<A-j>", ":m +1<CR>==", {desc = "switch curr line with line below"})
vim.keymap.set("n", "<A-k>", ":m -2<CR>==", {desc = "switch curr line with line above"})
-- <A-h> Harpoon prev item
-- <A-l> Harpoon next item

-- <C-j> Telescope move down
-- <C-k> Telescope move up


-- Harpoon Keymaps
local function harpoon_keymaps() 
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>a", mark.add_file, {desc = "harpoon add file"})

    vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, {desc = "harpoon quick menu"})
    vim.keymap.set("n", "<A-h>", ui.nav_prev, {desc = "harpoon nav prev file"})
    vim.keymap.set("n", "<A-l>", ui.nav_next, {desc = "harpoon nav next file"})

    vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, {desc = "harpoon nav to file 1"})
    vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, {desc = "harpoon nav to file 2"})
    vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, {desc = "harpoon nav to file 3"})
    vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, {desc = "harpoon nav to file 4"})
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
        vim.keymap.set('n', "<leader>k", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

      end,
    })
end

local function telescope()
    -- Telescope
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', "<leader>fk", builtin.keymaps, {desc = "Telescope find keymaps"})
    vim.keymap.set("n","<leader>fm", builtin.marks, {desc = "Telescope find vim marks and their value"})
    vim.keymap.set("n", "<leader>fc", builtin.colorscheme, {desc = "Telescope find colorschemes"})
    vim.keymap.set("n", "<leader>fl", builtin.oldfiles, {desc = "Telescope find last opened files"})
    vim.keymap.set("n", "<leader>fq", builtin.quickfixhistory, {desc = "Telescope find curr quickfix lists"})
    vim.keymap.set("n", "<leader>fj", builtin.jumplist, {desc = "Telescope find jumplist items"})
    vim.keymap.set("n", "<leader>fo", builtin.vim_options, {desc = "Telescope find vim options"})

    vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, {desc = "Telescope find lsp definitions"})
    vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {desc = "Telescope find lsp references"})
    vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, {desc = "Telescope find lsp implementations"})

    vim.api.nvim_create_user_command("Reg", builtin.registers, {desc = "Telescope find register items"})

    vim.keymap.set("n", "<leader>fu", "<cmd>Telescope undo<CR>")
end

harpoon_keymaps()
lsp_keymaps()
terminal()
telescope()

