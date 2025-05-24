
local cmp = require("cmp")

-- Attempts a snippet jump, if a new position is found returns true
local function try_jump(direction)
   local before = vim.api.nvim_win_get_cursor(0)
   vim.snippet.jump(direction)
   local after = vim.api.nvim_win_get_cursor(0)
   return before[1] ~= after[1] or before[2] ~= after[2]
end

local function tabcomplete(fallback)
    -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
    if try_jump(1) then
        -- Do nothing
    elseif cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        end
        cmp.confirm()
    else
        fallback()
    end
end

local function s_tabcomplete(fallback)
    -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
    if try_jump(-1) then
        -- Do nothing
    elseif cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        end
        cmp.confirm()
    else
        fallback()
    end
end

local function selectcomplete(fallback)
    local entry = cmp.get_selected_entry()
    if cmp.visible() and entry then
        cmp.confirm()
    else
        fallback()
    end
end

local function select_next(fallback)
    if cmp.visible() then
        cmp.select_next_item({behavior = "select"})
    else
        fallback()
    end
end

local function select_prev(fallback)
    if cmp.visible() then
        cmp.select_prev_item({behavior = "select"})
    else
        fallback()
    end
end


-- Cmp Sources
cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
        {name = 'copilot'}
    },
    snippet = {
        expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            vim.snippet.expand(args.body)
        end,
    },
--[[
    preselect = "item",
    completion = {
        completeopt = "menu,menuone,noinsert"
    },
]]--
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping(selectcomplete, {"i", "s", "c"}),
        ["<Tab>"] = cmp.mapping(tabcomplete, {"i", "s", "c"}),
        ["<S-Tab>"] = cmp.mapping(s_tabcomplete, {"i", "s", "c"}),
        ["<C-j>"] = cmp.mapping(select_next, {"i", "s", "c"}),
        ["<C-k>"] = cmp.mapping(select_prev, {"i", "s", "c"}),
    }),
})

