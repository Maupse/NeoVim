if not vim.g.vscode then
    require("config.plugin_config.marks")
    require("config.plugin_config.lsp")
    require("config.plugin_config.autocompletion")
    require("config.plugin_config.telescope")
    require("config.plugin_config.tree")
    require("config.plugin_config.lazygit")
end
