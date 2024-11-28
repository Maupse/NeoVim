--keep terms highlightet when searching
vim.opt.hlsearch = false

if not vim.g.vscode then
    --Line Numbers
    vim.opt.number = true
    vim.opt.relativenumber = true

    --4 Space indent
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true

    vim.opt.smartindent = true

    --Line Wrap (Text appears not going over the edge)
    vim.opt.wrap = false
    --Activate incremental highlighting
    vim.opt.incsearch = true

    --Enable 24-Bit color support
    vim.opt.termguicolors = true

    --Keep an 8 indent when scrolling
    vim.opt.scrolloff = 8

    --Column signs such as marks
    vim.opt.signcolumn = "yes"

    --Enable @ in file names
    vim.opt.isfname:append("@-@")

    --Amount of milliseconds vim waits after you stopped typing before triggering certain events
    --Default is 250ms
    vim.opt.updatetime = 50

    --Highlights a column at a specific width with color so you see a line
end
