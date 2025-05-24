require('config.keymaps.basic')

require('config.keymaps.navigation')
require('config.keymaps.system_navigation')
require('config.keymaps.file_system')

require('config.keymaps.telescope')
require('config.keymaps.harpoon')

local ok, err = pcall(require, 'config.keymaps.terminal')
if not ok then
    vim.notify("ERROR calling terminal keymaps: " ..err, vim.logs.levels.ERROR)
end

require('config.keymaps.lsp')
require('config.keymaps.trouble')
require('config.keymaps.copilot')

