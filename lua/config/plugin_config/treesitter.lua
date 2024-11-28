require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "zig",
        "rust",
        "elixir",
    },
    sync_install = true,
    highlight = {enable = true}
})
