local autopairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

autopairs.add_rule(
    Rule("|", "|")
    :with_move(function(opts)
        if opts.char == "|" then
            return true
        else
            return false
        end
    end)
)
