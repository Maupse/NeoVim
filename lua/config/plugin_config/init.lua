--Loading the plugin manager
require("config.plugin_config.lazy")

if not vim.g.vscode then
    require("config.plugin_config.lsp")
    require("config.plugin_config.autocompletion")
    require("config.plugin_config.treesitter")
end
