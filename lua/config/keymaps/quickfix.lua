-- For more keybinds go to https://neovim.io/doc/user/quickfix.html#%3Avimgrep

-- Each quickfix list has a unique session id
-- [q go to previous quickfix item
-- ]q go to next quickfix item

vim.keymap.set('n', '<leader>qf', ':copen<CR>')


-- Location Lists
-- A location list is a local quickfix list that is associated with a specific window.
-- [l go to previous loclist item
-- ]l go to next loclist item

vim.keymap.set('n', '<leader>ql', ':lopen')


-- Also look at https://github.com/nvim-telescope/telescope.nvim#default-mappings
