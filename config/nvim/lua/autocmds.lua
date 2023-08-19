-- autocmds.lua
-- By DesktopCoder1407

local autocmd = vim.api.nvim_create_autocmd

-- Automatically update and install plugins when the list is updated
autocmd({'BufWritePost'}, {
    pattern = {'plugins.lua'},
    command = 'PackerCompile'
})
