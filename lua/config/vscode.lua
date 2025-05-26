local vscode = require("vscode")

--Move Line up or down. The == i auto indent--
vim.keymap.set("n", "<A-j>", ":m +1<CR>==", {desc = "switch curr line with line below"})
vim.keymap.set("n", "<A-k>", ":m -2<CR>==", {desc = "switch curr line with line above"})

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Smarter indent moving
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Moving via Tab and S-Tab
vim.keymap.set("n", "<TAB>", ":bn<CR>")
vim.keymap.set("n", "<S-TAB>", ":bp<CR>")

-- Going to the last buffer with Backspace
vim.keymap.set("n", "<BS>", ":b#<CR>", {desc = "open last buffer"})


--keep terms highlightet when searching
vim.opt.hlsearch = true

-- Copy pasting from clipboard
vim.keymap.set("v", "<leader>c", '"*y')

vim.keymap.set("n", "<leader>v", '"*p')

vim.keymap.set("n", "Qh", ':nohlsearch<CR>')

-- Misspelling w still works
vim.api.nvim_create_user_command("W", "w", {})

-- Writing Buffer with strg+s
vim.keymap.set("n", "<C-s>", ":w<CR>")

-- Your existing commands
vim.keymap.set('n', "<leader>e", function() vscode.call("workbench.view.explorer") end, {})
vim.keymap.set("n", "<leader>qf", function() vscode.call("editor.action.quickFix") end, {})
vim.keymap.set("n", "<leader>af", function() vscode.call("editor.action.autoFix") end, {})
vim.keymap.set("n", "<leader>a", function() vscode.call("editor.action.fixAll") end, {})
vim.keymap.set("n", "<leader>rs", function() vscode.call("vscode-neovim.restart") end, {})

-- LSP Actions (equivalent to your LspAttach autocmd)
vim.keymap.set('n', 'K', function() vscode.call("editor.action.showHover") end, {})
vim.keymap.set('n', 'gd', function() vscode.call("editor.action.revealDefinition") end, {})
vim.keymap.set('n', 'gD', function() vscode.call("editor.action.revealDeclaration") end, {})
vim.keymap.set('n', 'gi', function() vscode.call("editor.action.goToImplementation") end, {})
vim.keymap.set('n', 'go', function() vscode.call("editor.action.goToTypeDefinition") end, {})
vim.keymap.set('n', 'gr', function() vscode.call("editor.action.goToReferences") end, {})
vim.keymap.set('n', 'gs', function() vscode.call("editor.action.triggerParameterHints") end, {})
vim.keymap.set('n', '<F2>', function() vscode.call("editor.action.rename") end, {})
vim.keymap.set({'n', 'x'}, '<F3>', function() vscode.call("editor.action.formatDocument") end, {})
vim.keymap.set('n', 'qf', function() vscode.call("editor.action.quickFix") end, {})
vim.keymap.set('n', "<leader>k", function() vscode.call("editor.action.showHover") end, {})

-- Telescope equivalents using VSCode's built-in functionality
vim.keymap.set('n', '<leader>ff', function() vscode.call("workbench.action.quickOpen") end, { desc = 'Quick Open Files' })
vim.keymap.set('n', '<leader>fg', function() vscode.call("workbench.action.findInFiles") end, { desc = 'Search in Files' })
vim.keymap.set('n', '<leader>fG', function() vscode.call("filesExplorer.findInFolder") end, { desc = 'Search in Current Folder' })
vim.keymap.set('n', '<leader>fb', function() vscode.call("workbench.action.showAllEditors") end, { desc = 'Show All Open Editors' })
vim.keymap.set('n', '<leader>fh', function() vscode.call("workbench.action.showCommands") end, { desc = 'Command Palette' })
vim.keymap.set('n', "<leader>fk", function() vscode.call("workbench.action.openGlobalKeybindings") end, {desc = "Open Keyboard Shortcuts"})
vim.keymap.set("n","<leader>fm", function() vscode.call("workbench.action.showAllEditors") end, {desc = "Show All Editors (closest to marks)"})
vim.keymap.set("n", "<leader>fc", function() vscode.call("workbench.action.selectTheme") end, {desc = "Select Color Theme"})
vim.keymap.set("n", "<leader>fl", function() vscode.call("workbench.action.openRecent") end, {desc = "Open Recent Files"})
vim.keymap.set("n", "<leader>fq", function() vscode.call("workbench.panel.markers.view.focus") end, {desc = "Focus Problems Panel"})
vim.keymap.set("n", "<leader>fj", function() vscode.call("workbench.action.navigateBack") end, {desc = "Navigate Back (jumplist equivalent)"})
vim.keymap.set("n", "<leader>fo", function() vscode.call("workbench.action.openSettings") end, {desc = "Open Settings"})
vim.keymap.set("n", "<leader>fd", function() vscode.call("editor.action.revealDefinition") end, {desc = "Go to Definition"})
vim.keymap.set("n", "<leader>fr", function() vscode.call("editor.action.goToReferences") end, {desc = "Go to References"})
vim.keymap.set("n", "<leader>fi", function() vscode.call("editor.action.goToImplementation") end, {desc = "Go to Implementation"})

-- Register equivalent (clipboard history)
vim.api.nvim_create_user_command("Reg", function() vscode.call("workbench.action.showCommands") end, {desc = "Command Palette (closest to registers)"})

-- Undo history equivalent
vim.keymap.set("n", "<leader>fu", function() vscode.call("workbench.action.showCommands") end, { desc = "Command Palette" })


-- Trouble plugin equivalents - Diagnostics and Problem Management
vim.keymap.set("n", "<leader>xx", function() vscode.call("workbench.panel.markers.view.focus") end, { desc = "Show Problems Panel (Diagnostics)" })
vim.keymap.set("n", "<leader>xX", function() vscode.call("editor.action.marker.nextInFiles") end, { desc = "Next Problem in Current File" })
vim.keymap.set("n", "<leader>cs", function() vscode.call("workbench.action.gotoSymbol") end, { desc = "Go to Symbol in Editor" })
vim.keymap.set("n", "<leader>cl", function() vscode.call("references-view.findReferences") end, { desc = "Find All References" })
vim.keymap.set("n", "<leader>xL", function() vscode.call("workbench.panel.markers.view.focus") end, { desc = "Focus Problems Panel (Location List)" })
vim.keymap.set("n", "<leader>xQ", function() vscode.call("workbench.panel.markers.view.focus") end, { desc = "Focus Problems Panel (Quickfix List)" })

-- Reveal file in system explorer
vim.keymap.set('n', '<leader>re', function()
    local current_dir = vim.fn.expand('%:p:h')
    if current_dir == '' then
        current_dir = vim.fn.getcwd()
    end

    if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
        vim.fn.system('explorer "' .. current_dir .. '"')
    elseif vim.fn.has('mac') == 1 then
        vim.fn.system('open "' .. current_dir .. '"')
    else
        vim.fn.system('xdg-open "' .. current_dir .. '"')
    end
end, { desc = 'Open file manager at current buffer location' })


