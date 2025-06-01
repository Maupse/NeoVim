-- Most useful default keybinds:
-- <C-W> followed by h j k l will switch windows
-- <C-W>s splits horizontally and adds a new window on top
-- <C-W>v splits vertically and adds a new window on the left
vim.keymap.set("v", "<leader>c", '"*y', {desc = "copy to clipboard"})
vim.keymap.set("n", "<leader>v", '"*p', {desc = "paste from clipboard"})

-- I dont know why <C-q> is block mode in windows terminal

-- Misspelling w still works
vim.api.nvim_create_user_command("W", "w", {desc = "write the buffer"})

-- Writing Buffer with strg+s
vim.keymap.set("n", "<C-s>", ":w<CR>", {desc = "write the buffer"})


vim.keymap.set("n", "Qh", ":nohlsearch<CR>")

-- Remap because gi = go to implementation for lsp
vim.keymap.set('n', 'gl', 'gi', { noremap = true, silent = true, desc = "go to last insert position"})

vim.keymap.set('n', 'qr', 'q', {noremap = true, desc = "recording"})
