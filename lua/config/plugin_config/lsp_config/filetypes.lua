-- gdscript needs tabs and not spaces
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        if vim.bo.filetype == "gdscript" then
            vim.bo.expandtab = false    -- Use spaces for other files
        else
            vim.bo.expandtab = true
        end
    end,
})

vim.filetype.add({
    extensions = {
        svx = "svelte",
    },
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.svx",
  command = "setfiletype svelte",
})
