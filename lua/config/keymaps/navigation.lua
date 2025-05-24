--Move Line up or down. The == i auto indent--
vim.keymap.set("n", "<A-j>", ":m +1<CR>==", {desc = "switch curr line with line below"})
vim.keymap.set("n", "<A-k>", ":m -2<CR>==", {desc = "switch curr line with line above"})

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Smarter indent moving
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Moving via Tab and S-Tab
vim.keymap.set("n", "<TAB>", ":bn<CR>")
vim.keymap.set("n", "<S-TAB>", ":bp<CR>")

-- Going to the last buffer with Backspace
vim.keymap.set("n", "<BS>", ":b#<CR>", {desc = "open last buffer"})

-- <A-h> Harpoon prev item
-- <A-l> Harpoon next item
