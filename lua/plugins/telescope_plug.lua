return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    -- requires ripgrep
    -- requires fd
    cond = function()
        return not vim.g.vscode
    end
}
