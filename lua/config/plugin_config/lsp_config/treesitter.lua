local configs = require("nvim-treesitter.configs")

configs.setup{
    ensure_installed = {
        "c", 
        "cpp",
        "rust",
        "elixir",
        "svelte",
        "tsx",
        "typescript",
        "javascript",
        "lua",
        "vim",
        "vimdoc",
        "markdown"
    },
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    highlight = {
        enable = true,

        -- Use names of the parsers
        disable = {},
        disable = function(lang, buf) 
            local max_filesize = 100 * 1024
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,  

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    }
}
