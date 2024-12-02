require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "zls",
        "clangd",
        "elixirls"
    }
})

local lspconfig = require("lspconfig")
local defaults = lspconfig.util.default_config

defaults.capabilities = vim.tbl_deep_extend(
    "force",
    defaults.capabilities,
    require("cmp_nvim_lsp").default_capabilities()
)

-- Setup calls will overwrite each other
lspconfig.lua_ls.setup {}

lspconfig.rust_analyzer.setup {}

lspconfig.zls.setup {}

lspconfig.clangd.setup {}

lspconfig.elixirls.setup {}

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

