local term = require('toggleterm')

if vim.os == 'windows' then 
    term.setup({
        shell = 'powershell.exe',
        size = 20,
        open_mapping = [[<C-\>]],
        shade_terminals = true,
        direction = 'horizontal',
    })
end
