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




autopairs.add_rule(
    Rule("<", ">")
    :with_pair(function (opts)
        if vim.bo.filetype == "cpp" then
            return false;
        end
    end)
    :with_move(function(opts)
        if opts.char == ">" then
            return true
        else
            return false
        end
    end)
)


