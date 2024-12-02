if vim.os == "windows" then
    if not vim.fn.executable("scoop") then
        error("You need to install scoop before running neovim to install all dependencies")
    end
    ensure_dependency("rg", "scoop install ripgrep")
    ensure_dependency("fd", "scoop install fd")
else
    print("YOU STILL NEED TO IMPLEMENT THE DEPENDENCY INSTALLATION FOR OTHER SYSTEMS")
end

local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup{
  defaults = {
      mappings = {
          i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              -- <C-q> = send all items to quickfix list (unfiltered)
              -- <M-q> (<A-q>) = send all items filtered to quickfix list
              -- <Tab> = Toggle selection and move to next selection
          }
      }
  },
  pickers = {},
  extensions = {
      undo = {}
  }
}

telescope.load_extension("undo")
