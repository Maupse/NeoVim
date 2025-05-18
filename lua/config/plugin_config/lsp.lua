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
        "elixirls",
        "ts_ls",
        "cssls",
        "wgsl_analyzer",
        "pyright",
        "glsl_analyzer",
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
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}

lspconfig.rust_analyzer.setup {}

lspconfig.zls.setup {}

lspconfig.clangd.setup {}

lspconfig.elixirls.setup {}

lspconfig.gdscript.setup {}

lspconfig.ts_ls.setup {}

lspconfig.cssls.setup {}

lspconfig.wgsl_analyzer.setup {}

lspconfig.pyright.setup {}

lspconfig.glsl_analyzer.setup {}



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

