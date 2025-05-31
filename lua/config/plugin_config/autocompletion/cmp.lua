
local cmp = require("cmp")


-- Cmp Sources
cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
        {name = 'copilot'}
    },
    snippet = {
        expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            vim.snippet.expand(args.body)
        end,
    },
})

