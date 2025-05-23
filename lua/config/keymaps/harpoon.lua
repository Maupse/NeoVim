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
