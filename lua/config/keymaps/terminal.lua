    -- Terminal keymaps
    -- The [[string literal]] are string literal, meaning escape characters like \ are mapped as strings
    function set_terminal_keymaps()
        local opts = {buffer = 0, desc = "escapes terminal mode"}
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
