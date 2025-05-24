local panel = require('copilot.panel')
local suggestion = require('copilot.suggestion')
-- Use :Copilot auth to authenticate
vim.keymap.set("n", "<leader>c", panel.toggle)
vim.keymap.set("n", "<leader>cs", suggestion.is_visible)

vim.keymap.set("n", "<leader>g", function ()
    local Terminal = require("toggleterm.terminal").Terminal
    local term = Terminal:new({
        direction = "float",
        close_on_exit = false,
        auto_scroll = true,

    })
    term:toggle()
    term:send("git status")
end, {desc = "open lazy menu"})

vim.keymap.set("n", "<leader>G", function ()
    local Terminal = require("toggleterm.terminal").Terminal
    local path = vim.fn.expand("%:p:h")
    local term = Terminal:new({
        direction = "float",
        close_on_exit = false,
        auto_scroll = true,
        dir = path

    })
    term:toggle()
    term:send("git status")
end, {desc = "open lazy menu"})


local cmp = require("cmp")
cmp.event:on("menu_opened", function()
  vim.b.copilot_suggestion_hidden = true
end)

cmp.event:on("menu_closed", function()
  vim.b.copilot_suggestion_hidden = false
end)


require('CopilotChat').setup {
 -- default mappings
  -- see config/mappings.lua for implementation
  mappings = {
    complete = {
      insert = '<Tab>',
    },
    close = {
      normal = 'q',
      insert = '<Esc>',
    },
    reset = {
      normal = '<C-l>',
      insert = '<C-l>',
    },
    submit_prompt = {
      normal = '<CR>',
      insert = '<C-s>',
    },
    toggle_sticky = {
      normal = 'grr',
    },
    clear_stickies = {
      normal = 'grx',
    },
    accept_diff = {
      normal = '<C-y>',
      insert = '<C-y>',
    },
    jump_to_diff = {
      normal = 'gj',
    },
    quickfix_answers = {
      normal = 'gqa',
    },
    quickfix_diffs = {
      normal = 'gqd',
    },
    yank_diff = {
      normal = 'gy',
      register = '"', -- Default register to use for yanking
    },
    show_diff = {
      normal = 'gd',
      full_diff = false, -- Show full diff instead of unified diff when showing diff window
    },
    show_info = {
      normal = 'gi',
    },
    show_context = {
      normal = 'gc',
    },
    show_help = {
      normal = 'gh',
    },
  },
}
