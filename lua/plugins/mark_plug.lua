return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  opts = {},
    cond = function() 
        return not vim.g.vscode
    end
}
