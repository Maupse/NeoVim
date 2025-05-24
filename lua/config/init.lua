if vim.g.vscode then
    vim.notify("loading vscode-neovim configuration...")
    require("config.vscode")
else
    require("config.lazy")

    local ok, err = pcall(require, "config.deps")
    if not ok then
	    vim.notify("ERROR CALLING DEPS: " ..err, vim.log.levels.ERROR)
    end

    require("config.editor_prefs")
    require("config.keymaps")

    local ok, err = pcall(require, "config.plugin_config")
    if not ok then
        vim.notify("ERROR CALLING PLUGIN CONFIG: " ..err, vim.log.levels.ERROR)
    end
end
