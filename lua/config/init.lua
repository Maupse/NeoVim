if vim.g.vscode then
    vim.notify("loading vscode-neovim configuration...")
    require("config.vscode")
else
    require("config.lazy")
    require("config.editor_prefs")
    require("config.plugin_config")
    require("config.keymaps")
end
