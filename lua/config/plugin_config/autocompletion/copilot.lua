local cmp = require("cmp")
local copilot = require("copilot")

vim.g.copilot = {
    cmp = true,
}

cmp.event:on("menu_opened", function()
  vim.b.copilot_suggestion_hidden = true
end)

cmp.event:on("menu_closed", function()
  vim.b.copilot_suggestion_hidden = false
end)

copilot.setup({
  suggestion = {
    suggestion = { enabled = false },
    panel = { enabled = false },
  }
})

-- This function directly mutates the cmp sources so there could
-- be a race condition
function toggle_copilot_cmp()
    local config = cmp.get_config()

    if vim.g.copilot.cmp then
        for i, source in ipairs(config.sources) do
            if source.name == "copilot" then
                table.remove(config.sources, i)

                vim.notify("Disabled copilot cmp")
                cmp.setup(config)

                local tmp = vim.g.copilot
                tmp.cmp = false
                vim.g.copilot = tmp
                break
            end
        end
    else
        table.insert(config.sources, {
            name = "copilot",
        })

        vim.notify("Enabling copilot cmp")
        cmp.setup(config)

        local tmp = vim.g.copilot
        tmp.cmp = true
        vim.g.copilot = tmp
    end
    print("Function end - cmp is now: ", vim.g.copilot.cmp)
end
