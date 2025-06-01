local autopairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

autopairs.add_rule(
    Rule("|", "|")
    :with_pair(function (opts)
        if vim.bo.filetype == "rust" then
            return true;
        else
            return false;
        end
    end)
    :with_move(function(opts)
        if opts.char == "|" then
            return true
        else
            return false
        end
    end)
)


local activate = {
    rust = true,
    html = true,
    java = true,
    tsx = true,
    svelte = true,
    typescriptreact = true,
    javascriptreact = true,
}


autopairs.add_rule(
    Rule("<", ">")
    :with_pair(function (opts)
        if activate[vim.bo.filetype] then
            return true;
        else
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


