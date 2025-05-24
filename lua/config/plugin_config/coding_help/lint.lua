-- Linters by file type
require('lint').linters_by_ft = {
    javascript = {'eslint'},
    typescript = {'eslint'}
}

-- try_lint without parameters tries to lint with the ft specifiers
vim.api.nvim_create_autocmd({"BufWritePost"}, {
    callback = function()
        require('lint').try_lint()
    end
})
