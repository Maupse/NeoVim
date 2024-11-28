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
        "zls"
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

