require("config.plugin_config")

require("config.editor_prefs")
require("config.keymaps")

if vim.g.vscode then
    vim.notify("loading vscode-neovim configuration...")
    require("config.vscode_specific")
end
