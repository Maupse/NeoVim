--keep terms highlightet when searching
vim.opt.hlsearch = true

--Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true

--4 Space indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth =  4
vim.opt.expandtab = true

vim.opt.smartindent = true

--Line Wrap (Text appears not going over the edge)
vim.opt.wrap = false

--Activate incremental highlighting
vim.opt.incsearch = true

--Keep an 8 indent when scrolling
vim.opt.scrolloff = 8

--Column signs such as marks
vim.opt.signcolumn = "yes"

--Enable @ in file names
vim.opt.isfname:append("@-@")

-- Amount of milliseconds vim waits after you stopped typing before
--  triggering certain events, Default is 250ms
vim.opt.updatetime = 50

-- Color column
vim.opt.colorcolumn = "80"

-- Scheme
vim.o.background = "dark"

--Enable 24-Bit color support
vim.opt.termguicolors = true

local colorscheme = "NeoSolarized"

local success = pcall(vim.cmd, string.format("colorscheme %s", colorscheme))
if not success or colorscheme == "" then
    print("Colorscheme not found!")
end
