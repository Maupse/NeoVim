return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true,
    cond = function()
        return not vim.g.vscode
    end
}
