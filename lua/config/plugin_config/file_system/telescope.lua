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
