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
    }
})


-- Semantic token highlights in case we don't have treesitter
-- vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function (args)
--         local client = vim.lsp.get_client_by_id(args.data.client_id)
--         if client.server_capabilities.semanticTokensProvider then
--             client.server_capabilities.semanticTokensProvider = {
--                 full = true,
--                 legend = {
--                     tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes,
--                     tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers,
--                 },
--                 range = true
--             }
--         end
--     end
-- })
--
