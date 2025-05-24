-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fG', function() 
    builtin.live_grep({
        cwd = vim.fn.expand('%:p:h') -- Gets the directory of the current buffer
    })
end, { desc = 'Telescope live grep on current buffer' })
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

-- <C-j> Telescope move down
-- <C-k> Telescope move up
