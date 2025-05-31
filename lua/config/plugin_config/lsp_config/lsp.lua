vim.lsp.default_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Will automatically enable all the servers
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls", -- Lua language server
        "pyright", -- Python language server

        "rust_analyzer", -- Rust language server
        "zls", -- zig language server
        "clangd", -- C/C++ language server

        "nextls", -- Elixir language server
        "ts_ls", -- TypeScript/JavaScript language server
        "cssls", -- CSS language server
        "tailwindcss", -- Tailwind CSS language server

        "svelte", -- Svelte language server
        "eslint", -- ESLint language server

        "wgsl_analyzer", -- WebGPU Shading Language server
        "glsl_analyzer", -- GLSL language server
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
