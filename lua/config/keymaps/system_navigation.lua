-- Explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {desc = "toggle tree file explorer"})

-- Open NeoVim config
vim.keymap.set("n", "<leader>oc", function()
   local path = vim.fn.stdpath('config')
   vim.cmd("NvimTreeClose")
   local command = string.format("NvimTreeOpen %s", path)
   vim.cmd(command)
end)

vim.keymap.set("n", "<leader>od", function()
   local path = vim.fn.stdpath('data')
   vim.cmd("NvimTreeClose")
   local command = string.format("NvimTreeOpen %s", path)
   vim.cmd(command)
end)

vim.keymap.set("n", "<leader>ow", function ()
   vim.cmd("NvimTreeClose")
   local cwd = vim.fn.getcwd()
   vim.cmd(string.format("NvimTreeOpen %s", cwd))
end)

-- Reveal file in system explorer
vim.keymap.set('n', '<leader>oe', function()
    local current_dir = vim.fn.expand('%:p:h')
    if current_dir == '' then
        current_dir = vim.fn.getcwd()
    end

    if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
        vim.fn.system('explorer "' .. current_dir .. '"')
    elseif vim.fn.has('mac') == 1 then
        vim.fn.system('open "' .. current_dir .. '"')
    else
        vim.fn.system('xdg-open "' .. current_dir .. '"')
    end
end, { desc = 'Open file manager at current buffer location' })

-- Change to current buffer's directory
vim.keymap.set('n', '<leader>ob', '<cmd>lcd %:p:h<cr>', { desc = 'Change to current buffer directory' })

vim.keymap.set('n', '<leader>oW', function()
    local git_root = vim.fs.find('.git', {
        upward = true,
        stop = vim.loop.os_homedir(),
        path = vim.fn.expand('%:p:h'),
    })[1]
    
    if git_root then
        local root_dir = vim.fn.fnamemodify(git_root, ':h')
        vim.cmd('lcd ' .. vim.fn.fnameescape(root_dir))
        print('Changed to git root: ' .. root_dir)
    else
        print('Not in a git repository')
    end
end, { desc = 'Change to git root directory' })
