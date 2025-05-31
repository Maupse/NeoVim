local panel = require('copilot.panel')
local suggestion = require('copilot.suggestion')


-- Use :Copilot auth to authenticate
vim.keymap.set("n", "<leader>cp", panel.toggle)

-- You don't want to toggle this when using cmp
vim.keymap.set('n', '<leader>cat', function()
    suggestion.toggle_auto_trigger()
    vim.notify("Copilot auto trigger")
end)

-- Calls a function defined in plugin config of copilot
vim.keymap.set('n', "<leader>ct", toggle_copilot_cmp, { desc = "Copilot Toggle" })


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
