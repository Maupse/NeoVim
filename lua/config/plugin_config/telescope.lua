local function ensure_dependency(cmd, install_cmd)
    print("You still need to make the function 'ensure_dependency' inside telescope config a global multiuse one")
    if vim.fn.executable(cmd) == 0 then
        print("Installing " .. cmd .. "...")
        vim.fn.system(install_cmd)
    end
end

if vim.os == "windows" then
    if not vim.fn.executable("scoop") then
        error("You need to install scoop before running neovim to install all dependencies")
    end
    ensure_dependency("rg", "scoop install ripgrep")
    ensure_dependency("fd", "scoop install fd")
else
    print("YOU STILL NEED TO IMPLEMENT THE DEPENDENCY INSTALLATION FOR OTHER SYSTEMS")
end


require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
