require("config.lazy")

require("config.editor_prefs")
require("config.keymaps")

require("config.plugin_config")

if vim.g.vscode then
    vim.notify("loading vscode-neovim configuration...")
    require("config.vscode_specific")
end
