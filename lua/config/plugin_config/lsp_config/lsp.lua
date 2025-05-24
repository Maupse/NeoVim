vim.lsp.default_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Will automatically enable all the servers
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "zls",
        "clangd",
        "nextls",
        "ts_ls",
        "cssls",
        "wgsl_analyzer",
        "pyright",
        "glsl_analyzer",
        "svelte",
        "eslint",
        "gdscript"
    }
})

-- Configuration of the servers
vim.lsp.config['lua_ls'] = {
    settings = {
        Lua = {
            diagnostics = {
                globals = {"vim"}
            },
            runtime = {
                version = 'LuaJIT'
            }
        }
    }
}


vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        if vim.bo.filetype == "gdscript" then
            vim.bo.expandtab = false    -- Use spaces for other files
        else
            vim.bo.expandtab = true
        end
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client.server_capabilities.semanticTokensProvider then
            client.server_capabilities.semanticTokensProvider = {
                full = true,
                legend = {
                    tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes,
                    tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers,
                },
                range = true
            }
        end
    end
})

