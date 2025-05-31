-- Global function for unsafe calling of configuration
function call_unsafe(package)
   local ok, err = pcall(require, package)
   if not ok then
       vim.notify("ERROR calling keymaps of: " .. package .. " -- " .. err, vim.log.levels.ERROR)
   end
end

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

    call_unsafe('config.plugin_config')

    -- It is important that keybind are loaded in after the plugins
    require("config.keymaps")
end
