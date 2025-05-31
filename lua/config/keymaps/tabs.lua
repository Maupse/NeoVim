vim.keymap.set('n', '<C-t>', ':tabnew<CR>')
vim.keymap.set('n', '<C-S-t>', ':tabnew<CR>') -- Doesnt work without session
vim.keymap.set('n', 't0', ':tabclose<CR>')

-- Probably doesnt work because of windows
vim.keymap.set('n', '<C-TAB>', ':tabnext<CR>')
vim.keymap.set('n', '<C-S-TAB>', ':tabprev<CR>')

for i = 1, 9 do
  vim.keymap.set('n', 't' .. i, ':tabn ' .. i .. '<CR>')
end
